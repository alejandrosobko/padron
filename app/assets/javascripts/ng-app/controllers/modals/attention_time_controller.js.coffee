angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, $stateParams, dentist, institute, Institute, WorkCalendar, errorHandler) ->
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
  @dentist = dentist
  @institute = institute
  @workCalendar = @institute.workCalendar
  @newWorkableHours = {}
  @hoursToRemove = []
  @daysToRemove = []
  @canSave = true
  @errors = []

  @cancel = ->
    $uibModalInstance.dismiss()

  # plus button
  @addHoursFor = (day) ->
    return unless @newWorkableHours[day]
    @_checkHours()
    if @canSave
      @workCalendar.updateDay(day, @newWorkableHours[day])
      @newWorkableHours[day] = undefined

  # save button
  @save = ->
    @_checkHours()
    if @canSave
      _.each(@days, (day) => @addHoursFor(day)) # save hours in the inputs
      @institute.workCalendar = @workCalendar
      if $stateParams.dentistId
        @_update()
      else
        @_notifyOk()

  @removeHourFrom = (day, hours) ->
    dayWanted = @workCalendar.getWorkableDayFor(day)
    hoursIndex = dayWanted.workableHours.indexOf(hours)
    if (hoursIndex > -1)
      @hoursToRemove.push(hours.id)
      dayWanted.workableHours.splice(hoursIndex, 1)
      if dayWanted.workableHours.length == 0
        @daysToRemove.push(dayWanted.id)
        dayIndex = @workCalendar.workableDays.indexOf(dayWanted)
        @workCalendar.workableDays.splice(dayIndex, 1)

  @clearAll = ->
    @newWorkableHours = {}


  @_checkHours = ->
    @canSave = _.every(@days, (day) =>
      if @_isEmpty(@newWorkableHours[day]) # to not save empty hours
        @newWorkableHours[day] = undefined
        return true
      @_passSimpleCheck(day) && @_passAdvanceCheck(@newWorkableHours[day], day)
    )
    @_showErrors()
    @canSave

  @_isEmpty = (newHours) ->
    (!newHours) || newHours['from'] == '' || newHours['to'] == ''

  # Checks like: to > from, and check the time with regex
  @_passSimpleCheck = (day) ->
    newHours = @newWorkableHours[day]
    pattern = RegExp(/^([01]?[0-9]|2[0-3]):[0-5][0-9]$/)

    resultOk = pattern.test(newHours.from) && pattern.test(newHours.to) && @_hourToDate(newHours.from) < @_hourToDate(newHours.to)
    @errors.push("En el día #{day} hay horarios incorrectos") if !resultOk
    resultOk

  # Check overlapping
  @_passAdvanceCheck = (newHours, day) ->
    @workCalendar.workableHoursFor(day) == [] ||
    _.every(@workCalendar.workableHoursFor(day), (hour) =>
      resultOk = !@_hoursOverlapping(newHours, hour)
      @errors.push("En el día #{day} se superponen los horarios") if !resultOk
      resultOk
    )

  # Returns true if newHours is overlapping hour
  @_hoursOverlapping = (newHours, hour) ->
    newFrom = @_hourToDate(newHours.from)
    newTo = @_hourToDate(newHours.to)
    hourFrom = @_hourToDate(hour.from)
    hourTo = @_hourToDate(hour.to)

    (newFrom <= hourFrom && newTo >= hourFrom && newTo <= hourTo) || # rodeo al from
    (newFrom >= hourFrom && newFrom <= hourTo && newTo >= hourTo) || # rodeo al to
    (newFrom <= hourFrom && newTo >= hourTo)                      || # rodeo todo
    (newFrom > hourFrom  && newTo < hourTo)                          # estoy en el medio

  @_showErrors = ->
    _.each(@errors, (error) -> errorHandler.error(error))
    @errors = []

  @_update = ->
    @institute.hours_to_remove = @hoursToRemove
    @institute.days_to_remove = @daysToRemove
    @institute.update().then(
      (success) =>
        @_notifyOk()
      (error) =>
        if error.status == 500 # server fails and I don't know why
          errorHandler.error('Ocurrió un error guardando los horarios. Por favor, contacte con el administrador.')
        else
          for key_error in Object.keys(error.data)
            errorHandler.error(error.data[key_error][0])
    )

  @_notifyOk = ->
    errorHandler.success('Se guardaron los horarios correctamente')
    $uibModalInstance.dismiss()

  @_hourToDate = (stringHour) ->
    new Date('2000, 1, 1 ' + stringHour)


  @
)