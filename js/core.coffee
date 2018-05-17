class App

  @ticketEdit: document.querySelector '#ticketEdit'
  @ticketDone: document.querySelector '#ticketDone'
  @copyButton: document.querySelector '#copyButton'
  @clearButton: document.querySelector '#clearButton'
  @autoStatus: document.querySelector '#autoStatus'
  @manualStatus: document.querySelector '#manualStatus'

  @statuses: [
    'Статус=0 (Ожидание проведения)',
    'Статус=7 (Платеж завершен)',
    'Статус=1 (Платеж проводится)',
    'Статус=100 (Платеж не проведен)',
    'Статус=120 (Платеж заблокирован при обработке)',
    'Статус=112 (Платеж проведен оффлайн)',
    'Статус=102 (Платеж отменен вручную)',
  ]
  @errors: [
    'Ошибка=3003 (Превышен дневной лимит)',
    'Ошибка=1200200 (Откат транзакции)',
    'Ошибка=1220140 (Ошибочный номер абонента)',
    'Ошибка=1220117 (Недостаточно средств на счету дилера для проведения этого платежа)',
    'Ошибка=1200002 (Состояние платежа неизвестно, сбой при осуществлении платежа в биллинг провайдера (в последствии состояние будет изменено на проведен или на один из откатов))',
    'Ошибка=53 (Точка заблокирована)',
    'Ошибка=1200200 (Откат транзакции)'
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
    return

  @changeStatus: (element) ->
    console.log element
    @autoStatus.classList.remove 'active'
    @manualStatus.classList.remove 'active'
    element.classList.add 'active'
    return

  @manualMode: (value) ->
    dateObj = new Date()
    [terminal, date, amount, number, operator, comment] = value.split("\n");
    amount = '' if amount is undefined
    amount += '.00'
    date = '' if date is undefined
    getDate = dateObj.getDate()
    getMonth = dateObj.getMonth() + 1
    getFullYear = dateObj.getFullYear()
    getDate = "0#{getDate}" if getDate < 10
    getMonth = "0#{getMonth}" if getMonth < 10
    if date.indexOf('.') is -1
      date = "#{getDate}.#{getMonth}.#{getFullYear} #{date}"
    @ticketDone.value = @genTicket(terminal, date, amount, number, operator, comment, -1, -1)
    return

  @autoMode: (value) ->
    valuesArray = value.split ';'
    terminal = valuesArray[1]
    date = valuesArray[2]
    amount = valuesArray[6] + '.00'
    number = valuesArray[4]
    error = valuesArray[10]
    status = valuesArray[9]
    numberPattern = /\d{5,}/
    number = number.match numberPattern
    operator = valuesArray[5]
    @ticketDone.value = @genTicket(terminal, date, amount, number, operator, '', status, error)
    return

  @getStatus: (val) ->
    for status in @statuses
      if status.indexOf(val) isnt -1
        return status
    return ''

  @getError: (val) ->
    for error in @errors
      if error.indexOf(val) isnt -1
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

  @genTicket: (terminal = '', date = '', amount = '', number = '', operator = '', comment = '', status, error) ->
    status = @getStatus status
    error = @getError error
    return "Терминал: #{terminal}\nДата/время: #{date}\nСумма: #{amount}\nНомер счета/телефона: #{number}\nВерный номер счета/телефона:\nСервис/Оператор: #{operator}\nВерный Сервис/Оператор:\nКомментарий: #{comment}\n#{status}\n#{error}"

App.init()