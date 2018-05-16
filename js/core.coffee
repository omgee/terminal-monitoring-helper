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
    'Статус=100 (Платеж не проведен)',
    'Статус=120 (Платеж заблокирован при обработке)'
  ]
  @errors: [
    'Ошибка=3003 (Превышен дневной лимит)',
    'Ошибка=1200200 (Откат транзакции)',
    'Ошибка=1220140 (Ошибочный номер абонента)'
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

  @getError: (val) ->
    for error in @errors
      if error.indexOf(val) isnt -1
        return error

  @editListener: () ->
    value = App.ticketEdit.value
    if value.indexOf(';') isnt -1
      App.changeStatus App.autoStatus
      App.autoMode value
    else
      App.changeStatus App.manualStatus
      App.manualMode value
    return

  @genTicket: (terminal, date, amount, number, operator, comment, status, error) ->
    return "Терминал: #{terminal}\nДата/время: #{date}\nСумма: #{amount}\nНомер счета/телефона: #{number}\nВерный номер счета/телефона:\nСервис/Оператор: #{operator}\nВерный Сервис/Оператор:\nКомментарий: #{comment}\n#{@getStatus status}\n#{@getError error}"

App.init()