// Generated by CoffeeScript 2.3.0
(function() {
  var App;

  App = (function() {
    class App {
      static init() {
        this.copyButton.addEventListener('click', this.copy);
        this.clearButton.addEventListener('click', this.clear);
        this.ticketEdit.addEventListener('keyup', this.editListener);
      }

      static copy() {
        App.ticketDone.select();
        document.execCommand('copy');
      }

      static clear() {
        App.ticketEdit.value = '';
        App.ticketDone.value = '';
      }

      static changeStatus(element) {
        console.log(element);
        this.autoStatus.classList.remove('active');
        this.manualStatus.classList.remove('active');
        element.classList.add('active');
      }

      static manualMode(value) {
        var amount, comment, date, dateObj, getDate, getFullYear, getMonth, number, operator, terminal;
        dateObj = new Date();
        [terminal, date, amount, number, operator, comment] = value.split("\n");
        if (amount === void 0) {
          amount = '';
        }
        amount += '.00';
        if (date === void 0) {
          date = '';
        }
        getDate = dateObj.getDate();
        getMonth = dateObj.getMonth() + 1;
        getFullYear = dateObj.getFullYear();
        if (getDate < 10) {
          getDate = `0${getDate}`;
        }
        if (getMonth < 10) {
          getMonth = `0${getMonth}`;
        }
        if (date.indexOf('.') === -1) {
          date = `${getDate}.${getMonth}.${getFullYear} ${date}`;
        }
        this.ticketDone.value = this.genTicket(terminal, date, amount, number, operator, comment, -1, -1);
      }

      static autoMode(value) {
        var amount, date, error, number, numberPattern, operator, status, terminal, valuesArray;
        valuesArray = value.split(';');
        terminal = valuesArray[1];
        date = valuesArray[2];
        amount = valuesArray[6] + '.00';
        number = valuesArray[4];
        error = valuesArray[10];
        status = valuesArray[9];
        numberPattern = /\d{5,}/;
        number = number.match(numberPattern);
        operator = valuesArray[5];
        this.ticketDone.value = this.genTicket(terminal, date, amount, number, operator, '', status, error);
      }

      static getStatus(val) {
        var i, len, ref, status;
        ref = this.statuses;
        for (i = 0, len = ref.length; i < len; i++) {
          status = ref[i];
          if (status.indexOf(val) !== -1) {
            return status;
          }
        }
        return '';
      }

      static getError(val) {
        var error, i, len, ref;
        ref = this.errors;
        for (i = 0, len = ref.length; i < len; i++) {
          error = ref[i];
          if (error.indexOf(val) !== -1) {
            return error;
          }
        }
        return '';
      }

      static editListener() {
        var value;
        value = App.ticketEdit.value;
        if (value.indexOf(';') !== -1) {
          App.changeStatus(App.autoStatus);
          App.autoMode(value);
        } else {
          App.changeStatus(App.manualStatus);
          App.manualMode(value);
        }
      }

      static genTicket(terminal = '', date = '', amount = '', number = '', operator = '', comment = '', status, error) {
        status = this.getStatus(status);
        error = this.getError(error);
        return `Терминал: ${terminal}\nДата/время: ${date}\nСумма: ${amount}\nНомер счета/телефона: ${number}\nВерный номер счета/телефона:\nСервис/Оператор: ${operator}\nВерный Сервис/Оператор:\nКомментарий: ${comment}\n${status}\n${error}`;
      }

    };

    App.ticketEdit = document.querySelector('#ticketEdit');

    App.ticketDone = document.querySelector('#ticketDone');

    App.copyButton = document.querySelector('#copyButton');

    App.clearButton = document.querySelector('#clearButton');

    App.autoStatus = document.querySelector('#autoStatus');

    App.manualStatus = document.querySelector('#manualStatus');

    App.statuses = ['Статус=0 (Ожидание проведения)', 'Статус=7 (Платеж завершен)', 'Статус=1 (Платеж проводится)', 'Статус=100 (Платеж не проведен)', 'Статус=120 (Платеж заблокирован при обработке)', 'Статус=112 (Платеж проведен оффлайн)', 'Статус=102 (Платеж отменен вручную)'];

    App.errors = ['Ошибка=3003 (Превышен дневной лимит)', 'Ошибка=1200200 (Откат транзакции)', 'Ошибка=1220140 (Ошибочный номер абонента)', 'Ошибка=1220117 (Недостаточно средств на счету дилера для проведения этого платежа)', 'Ошибка=1200002 (Состояние платежа неизвестно, сбой при осуществлении платежа в биллинг провайдера (в последствии состояние будет изменено на проведен или на один из откатов))', 'Ошибка=53 (Точка заблокирована)', 'Ошибка=1200200 (Откат транзакции)'];

    return App;

  }).call(this);

  App.init();

}).call(this);

//# sourceMappingURL=core.js.map
