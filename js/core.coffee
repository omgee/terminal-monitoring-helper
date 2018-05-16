class App

  @ticketEdit: document.querySelector('#ticketEdit')
  @ticketDone: document.querySelector('#ticketDone')

  @init: () ->
    document.querySelector('#copyButton').addEventListener('click', @copy)
    document.querySelector('#eraseButton').addEventListener('click', @clear)
    return

  @copy: () ->
    App.ticketDone.select()
    document.execCommand('copy')
    return

  @clear: () ->
    App.ticketEdit.value = '';
    App.ticketDone.value = '';
    return

  @genTicket: (terminal, date, amount, number, operator, comment) ->
    return "Терминал: #{terminal}\nДата/время: #{date}\nСумма: #{amount}\nНомер счета/телефона: #{number}\nВерный номер счета/телефона:\nСервис/Оператор: #{operator}\nВерный Сервис/Оператор:\nКомментарий: #{comment}"

App.init()