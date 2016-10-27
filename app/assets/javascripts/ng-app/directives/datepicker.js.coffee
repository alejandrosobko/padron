angular.module('padronApp')
  .directive('datepicker', ->
    template: '<div class="input-group">
                 <input type="text" class="form-control"
                        data-ng-required="true"
                        data-uib-datepicker-popup="dd-MM-yyyy"
                        data-is-open="datePickerCtrl.popup.opened"
                        data-datepicker-options="datePickerCtrl.dateOptions"
                        data-current-text="Hoy"
                        data-close-text="Salir"
                        data-ng-model="ModalCtrl.newVisit.visitDate"
                        data-clear-text="Limpiar"
                        data-ng-click="datePickerCtrl.open()"/>
                 <span class="input-group-btn">
                   <button type="button" class="form-control btn btn-default"
                           data-ng-click="datePickerCtrl.open()">
                     <i class="glyphicon glyphicon-calendar"></i>
                   </button>
                 </span>
               </div>'
    controller: 'DatePickerCtrl as datePickerCtrl'
  )
  .controller('DatePickerCtrl', ->
    getDayClass = (data) ->
      date = data.date
      mode = data.mode
      if mode == 'day'
        dayToCheck = new Date(date).setHours(0, 0, 0, 0)
        i = 0
        while i < @events.length
          currentDay = new Date(@events[i].date).setHours(0, 0, 0, 0)
          if dayToCheck == currentDay
            return @events[i].status
          i++
      ''

    @clear = ->
      @newVisit.visitDate = null

    @inlineOptions =
      customClass: getDayClass
      minDate: new Date
      showWeeks: true

    @dateOptions =
      maxDate: new Date
      minDate: new Date startingDay: 1

    @open = ->
      @popup.opened = true

    @popup =
      opened: false


    @
  )