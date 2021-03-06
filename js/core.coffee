class App

  @ticketEdit: document.querySelector '#ticketEdit'
  @ticketDone: document.querySelector '#ticketDone'
  @copyButton: document.querySelector '#copyButton'
  @clearButton: document.querySelector '#clearButton'
  @autoStatus: document.querySelector '#autoStatus'
  @manualStatus: document.querySelector '#manualStatus'

  @ownerStatus: document.querySelector '#ownerStatus'
  @owners: [
    '9887450:925507298',
    '509:926430029',
    '1015:919595355',
    '8895258:892611946',
    '9888525:796368308',
    '15121068:915030500',
    '9888554:792544764',
    '15121084:573661632',
    '9872925:181336918',
    '15121072:915030500',
    '351:928801300',
    '147:849570026',
    '354:892505114',
    '87654795:928504940',
    '9459029:926276229',
    '9888249:890916064',
    '8895253:892611946',
    '452:910437342',
    '15121201:964789427',
    '452:910437342',
    '77:928504940',
    '15121045:966329325',
    '10089282:150848884',
    '15121024:100702930',
    '8895287:271376705',
    '87654843:919633535',
    '87654910:926952111',
    '87654939:163218918',
    '15121172:915006831',
    '304;:953253832',
    '8895078:913775145',
    '15121231:899903293',
    '10087073:100702364',
    '10087073:915714667',
    '15121078:915030500',
    '10085029:100704892',
    '8895075:403979848',
    '336;:967937981',
    '10085023:100702363',
    '395:985142160',
    '10087073:790560951',
    '9888533:850012436',
    '304:953253832',
    '395:985142160',
    '8895112:925657555',
    '9459039:926666385',
    '491:926430029',
    '483:912032537',
    '304:953253832',
    '87654399:962646164',
    '185:962646164',
    '87654491:977329585',
    '8895121:977312180',
    '87654326:928504940',
    '327:928504940',
    '8895006:929972377',
    '327:928504940',
    '488:926430029',
    '9888004:862203011',
    '9888004:862203011',
    '9888004:918433037',
    '178:925009899',
    '87654874:928504940',
    '385:965579192',
    '15121211:964789427',
    '9872999:926119462',
    '15121081:701412252',
    '8895135:898501345',
    '490:926430029',
    '9888269:909160646',
    '10082927:921919757',
    '9888631:881233717',
    '565:100709068',
    '15121357:928504940',
    '305:953253832',
    '399:980343123',
    '15121202:201151698',
    '305:953253832',
    '87654571:924667413',
    '9888521:924265495',
    '15121211:964789427',
    '10089282:904000663',
    '15121063:915177473',
    '9887460:965337627',
    '9887417:892505114',
    '15121058:915030500',
    '327:928504940',
    '9888244:924667413',
    '9888244:924667413',
    '546:278801111',
    '325:928504940',
    '15121218:964520577',
    '15121196:896479427',
    '15121218:964520577',
    '15121058:100711404',
    '9888333:924667413',
    '489:926430029',
    '87654874:928504940',
    '102:912976200',
    '311:938220023',
    '9888549:890609657',
    '87654949:100711679',
    '513:926430029',
    '9888549:890609657',
    '254:100711653',
    '9887417:892505114',
    '495:926430029',
    '88:953253832',
    '9888536:906096574',
    '9714430:926119462',
    '9888549:890609657',
    '87654949:100711675',
    '397:985368971',
    '273:964563102',
    '273:890609657',
    '9888542:926917433',
    '1021:912976200',
    '399:900362827',
    '548:989730900',
    '87654761:920789111',
    '9714430:891643235',
    '493:926430029',
    '441:890916064',
    '353:892505114',
    '290:953253832',
    '327:928504940',
    '107:912976200',
    '399:980343123',
    '9714453:732693843',
    '9887419:965337627',
    '8895223:892894140',
    '459:926430029',
    '343:928801300',
    '87654527:904402867',
    '9459037:929554787',
    '87654958:985142160',
    '448:892867140',
    '8895261:926119462',
    '221:792627198',
    '87654401:962646164',
    '497:926430029',
    '9459029:940762381',
    '9888525:916868439',
    '87654949:100717205',
    '87654889:116783853',
    '497:926430029',
    '87654949:967305704',
    '378:891189661',
    '9459028:205723905',
    '9888526:890609657',
    '325:928504940',
    '87654489:985142160',
    '357726:928250904',
    '87654781:920789111',
    '343:928801300',
    '87654500:985142160',
    '9459020:967131227',
    '220:892601527',
    '41:896342063',
    '41:896478942',
    '170:790948587',
    '8895299:891483786',
    '316:892859930',
    '170:928671407',
    '228:926271983',
    '9714453:796523057',
    '87654493:890577657',
    '225:892601527',
    '8893177:928677177',
    '10084585:909270758',
    '10085023:151912673',
    '87654490:890577655',
    '87654326:928504940',
    '9888526:968094693',
    '223:892601527',
    '15121358:928504940',
    '15121355:220220013',
    '87654489:274306925',
    '8895010:928016359',
    '316:964008800',
    '88 :960225022',
    '87654869:915030500',
    '195:928671407',
    '87654493:890577657',
    '9888542:926917433',
    '9888526:890609657',
    '15121356:928504940',
    '15121356:928504940',
    '87654401:928504940',
    '87654412:928504940',
    '9888269:909160646',
    '87654874:962646164',
    '9887566:921205643',
    '320:962646164',
    '15121320:962646164',
    '327:962646164',
    '325:962646164',
    '15121309:962646164',
    '9459027:962646164',
    '9459053:892855757',
    '352:928801300',
    '9888521:906096574',
    '159:965337627',
    '9887566:921205643',
    '116:925009899',
    '8895598:909160646',
    '87654487:985142160',
    '9888521:906096574',
    '9888542:926917433',
    '87654487:985142160',
    '87654958:985142160',
    '170:928671407',
    '9888521:890609657',
    '220:892601527',
    '8895259:926529723',
    '87654918:212012922',
    '87654493:890577657',
    '8895157:533669006',
    '15121211:964789427',
    '15121361:962646164',
    '9888237:924667413',
    '9887261:348740789',
    '9714460:928505835',
    '9872978:988774080',
    '170:928671407',
    '162:965337627',
    '87654833:489049445',
    '87654400:962646164',
    '9888542:926917433',
    '87654910:915030500',
    '170:928671407',
    '230:926271983',
    '87654401:962646164',
    '230:926271983',
    '8895243:926119462',
    '9888542:965337627',
    '15121358:962646164',
    '9888258:909160646',
    '15121358:962646164',
    '8893543:928542491',
    '15121007:906096574',
    '87654498:985142160',
    '193:921977077',
    '378:911373499',
    '8893177:928677177',
    '154:968903591',
    '87654489:985142160',
    '9888542:926917433',
    '87654493:890577657',
    '9888542:926917433',
    '87654493:905776557',
    '8895006:892805689',
    '9888535:906096574',
    '9888535:906096574',
    '87654781:920789111',
    '325:962646164',
    '9888536:906096574',
    '9887454:965337627',
    '156:968904262',
    '87654552 :985142160',
    '354:925051149',
    '9714417:969809515',
    '110:892505114',
    '15121045:915030500',
    '15121358:100728292',
    '246:862584750',
    '15121133:909160646',
    '597:928801300',
    '580:989730900',
    '9888533:906096574',
    '15121133:909160646',
    '87654491:905776557',
    '87654833:791963353',
    '87654491:905776557',
    '87654833:919633535',
    '87654833:919633535',
    '8895262:977117731',
    '607:152747350',
    '298:953253832',
    '15121211:964789427',
    '101:152759301',
    '9888260:909160646',
    '9887454:965337627',
    '9888549:906096574',
    '87654489:985142160',
    '170:928671407',
    '8895089:289242674',
    '87654491:905776557',
    '9714455:989864125',
    '9714418:916112970',
    '15121358:410017245',
    '9888820:892197707',
    '87654833:919633535',
    '87654489:905718015',
    '612:920193663',
    '164 :916178135',
    '623:920697731',
    '9459020:996967337',
    '87654936:100729433',
    '233:102005745',
    '161:965337627',
    '556:977399826',
    '15121206:964789427',
    '9714430:555510004',
    '15121212:964789427',
    '9888423:906096574',
    '9887452:965337627',
    '9888423:906096574',
    '170:244546091',
    '9459055:926119462',
    '147:965337627',
    '147:965337627',
    '15121203:896478942',
    '15121320:928504940',
    '9888234:892197707',
    '87654833:919633535',
    '170:928671407',
    '146:965337627',
    '9888423:906096574',
    '9888423:906096574',
    '87654833:919633535',
    '230:926271983',
    '87654936:962646164',
    '9888542:926917433',
    '355:892505114',
    '336:964008800',
    '336:964008800',
    '9888525:965337627',
    '15121076:915030500',
    '87654939:928815105',
    '682:908121780',
    '15121320:962646164',
    '195:962646164',
    '8895167:928557571',
    '9887452:965337627',
    '15121301:962646164',
    '325:928504940',
    '8895362:926119462',
    '15121320:962646164',
    '541:909160646',
    '568:909160646',
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