class App

  @ticketEdit: document.querySelector '#ticketEdit'
  @ticketDone: document.querySelector '#ticketDone'
  @copyButton: document.querySelector '#copyButton'
  @clearButton: document.querySelector '#clearButton'
  @autoStatus: document.querySelector '#autoStatus'
  @manualStatus: document.querySelector '#manualStatus'

  @ownerStatus: document.querySelector '#ownerStatus'
  @owners: [
    '87654491:9057765572',
    '354:9250511492',
    '15121045:9150305000',
    '495:9264300299',
    '9888549:9060965746',
    '314:9640088004',
    '513:9264300299',
    '9887417:9250511492',
    '496:9264300299',
    '552:9640088084',
    '9888542:9269174337',
    '8765476:87654761',
    '399:9803431231',
    '107:9129762003',
    '87654958:9851421603',
    '9458936:9285551027',
    '87654401:9626461645',
    '497:9264300299',
    '343:9288013005',
    '889522:9289414041',
    '109:9129762003',
    '87654781:9207891111',
    '400:9803431231',
    '87654878:9285049405',
    '15121205:9647894278',
    '87654490:9057765572',
    '9887645:9212056430',
    '225:9260152710',
    '9887454:9653376277'
  ]

  @statuses: [
    'Статус=0 (Ожидание проведения)',
    'Статус=7 (Платеж завершен)',
    'Статус=1 (Платеж проводится)',
    'Статус=100 (Платеж не проведен)',
    'Статус=108 (Платеж проведен вручную)',
    'Статус=120 (Платеж заблокирован при обработке)',
    'Статус=112 (Платеж проведен оффлайн)',
    'Статус=102 (Платеж отменен вручную)',
    'Статус=103 (Запрос на ручную отмену платежа)'
  ]
  @errors: [
    'Ошибка=3003 (Превышен дневной лимит)',
    'Ошибка=1200200 (Откат транзакции)',
    'Ошибка=1200500 (Откат транзакции)',
    'Ошибка=1220110 (Оплата в пользу сервис-провайдера невозможна)',
    'Ошибка=1220140 (Ошибочный номер абонента)',
    'Ошибка=1220117 (Недостаточно средств на счету дилера для проведения этого платежа)',
    'Ошибка=1200002 (Состояние платежа неизвестно, сбой при осуществлении платежа в биллинг провайдера (в последствии состояние будет изменено на проведен или на один из откатов))',
    'Ошибка=53 (Точка заблокирована)',
    'Ошибка=1220002 (Платеж в обработке)',
    'Ошибка=1200300 (Недостаточно денег на счете дилера)',
    'Ошибка=1220103 (Не найдена касса, соответствующая этому пользователю)',
    'Ошибка=1220000 (Платеж в очереди)',
    'Ошибка=2002 (Сетевая ошибка)'
  ]

  @init: () ->
    @copyButton.addEventListener 'click', @copy
    @clearButton.addEventListener 'click', @clear
    @ticketEdit.addEventListener 'keyup', @editListener
    return

  @copy: () ->
    App.ticketDone.select()
    document.execCommand 'copy'
    return

  @clear: () ->
    App.ticketEdit.value = '';
    App.ticketDone.value = '';
    App.changeOwner 'Нет'
    App.changeStatus()
    return

  @changeStatus: (element) ->
    if element is undefined
      element = @manualStatus
    @autoStatus.classList.remove 'active'
    @manualStatus.classList.remove 'active'
    element.classList.add 'active'
    return

  @changeOwner: (number) ->
    @ownerStatus.innerHTML = number;
    return

  @manualMode: (value) ->
    dateObj = new Date()
    [terminal, date, amount, number, operator, comment] = value.split("\n");
    @changeOwner(@getOwner(terminal.split(' ')[0]))
    terminal = terminal.split(' ').join(' / ')
    number = '' if number is undefined
    operator = '' if operator is undefined
    amount = '' if amount is undefined
    number = number.split(' ').join(' / ')
    operator = operator.split(' ').join(' / ')
    amount = '' if amount is undefined
    amount = ("#{am}.00" for am in amount.split(' '))
    amount = amount.join(' / ')
    date = '' if date is undefined
    genDate = (date) ->
      getDate = dateObj.getDate()
      getMonth = dateObj.getMonth() + 1
      getFullYear = dateObj.getFullYear()
      getDate = "0#{getDate}" if getDate < 10
      getMonth = "0#{getMonth}" if getMonth < 10
      if date.indexOf('.') is -1
        return date = "#{getDate}.#{getMonth}.#{getFullYear} #{date}"
      else
        return date
    dates = (genDate da for da in date.split(' '))
    dates = dates.join(' / ')
    @ticketDone.value = @genTicket(terminal, dates, amount, number, operator, comment, -1, -1)
    return

  @autoMode: (value) ->
    Array::unique = ->
      output = {}
      output[@[key]] = @[key] for key in [0...@length]
      value for key, value of output
    value = value.replace(/^\s+|\s+$/g, '');
    terminal = []
    date = []
    amount = []
    number = []
    numberPattern = /\d{6,}/
    operator = []
    error = ''
    status = ''
    for val in value.split("\n")
      valuesArray = val.split ';'
      terminal.push valuesArray[1]
      date.push valuesArray[2]
      amount.push valuesArray[6] + '.00'
      number.push valuesArray[4].match numberPattern
      operator.push valuesArray[5]
      status = valuesArray[9]
      error = valuesArray[10]
    terminal = terminal.unique()
    @changeOwner @getOwner(terminal[0])
    date = date.unique()
    number = number.unique()
    operator = operator.unique()
    terminal = terminal.join(' / ')
    date = date.join(' / ')
    amount = amount.join(' / ')
    number = number.join(' / ')
    operator = operator.join(' / ')
    @ticketDone.value = @genTicket(terminal, date, amount, number, operator, '', status, error)
    return

  @getStatus: (val) ->
    for status in @statuses
      if status.indexOf("Статус=#{val}") isnt -1
        return status
    return ''

  @getError: (val) ->
    for error in @errors
      if error.indexOf("Ошибка=#{val}") isnt -1
        return error
    return ''

  @editListener: () ->
    value = App.ticketEdit.value
    if value.indexOf(';') isnt -1
      App.changeStatus App.autoStatus
      App.autoMode value
    else
      App.changeStatus App.manualStatus
      App.manualMode value
    return

  @getOwner: (terminal) ->
    for val in @owners
      if val.split(':')[0] is terminal
        return val.split(':')[1]
    return 'Нет'

  @genTicket: (terminal = '', date = '', amount = '', number = '', operator = '', comment = '', status, error) ->
    status = @getStatus status
    error = @getError error
    return "Терминал: #{terminal}\nДата/время: #{date}\nСумма: #{amount}\nНомер счета/телефона: #{number}\nВерный номер счета/телефона:\nСервис/Оператор: #{operator}\nВерный Сервис/Оператор:\nКомментарий: #{comment}\n#{status}\n#{error}"

App.init()