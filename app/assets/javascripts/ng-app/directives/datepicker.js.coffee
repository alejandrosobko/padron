angular.module('padronApp')
  .directive('datepicker', ->
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