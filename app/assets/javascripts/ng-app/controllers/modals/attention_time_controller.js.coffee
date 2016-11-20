angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, WorkCalendar, errorHandler) ->
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
  @dentist = dentist
  @workCalendar = dentist.getWorkCalendar()
  @newWorkableHours = {}
  @hoursToRemove = []
  @daysToRemove = []
  @canSave = true

  @cancel = ->
    $uibModalInstance.dismiss()

  # plus button
  @addHoursFor = (day) ->
    return unless @newWorkableHours[day]
    @_checkHours()
    if @canSave
      @workCalendar.updateDay(day, @newWorkableHours[day])
      @newWorkableHours[day] = undefined
    else
      errorHandler.error("Hay horarios incorrectos")

  # save button
  @save = ->
    @_checkHours()
    if @canSave
      _.each(@days, (day) => @addHoursFor(day)) # save hours in inputs
      dentist.workCalendar = @workCalendar
      if dentist.id
        @_update()
      else
        @_notifyOk()
    else
      errorHandler.error("Hay horarios incorrectos")

  @_checkHours = ->
    @canSave = _.every(@days, (day) =>
      if @_isEmpty(@newWorkableHours[day]) # to not save empty hours
        @newWorkableHours[day] = undefined
        return true
      @_passSimpleCheck(@newWorkableHours[day]) && @_passAdvanceCheck(@newWorkableHours[day], day)
    )

  @_isEmpty = (newHours) ->
    (!newHours) || newHours['from'] == "" || newHours['to'] == ""

  # This completes with leading zeros because it doesn't by the library
  @_passSimpleCheck = (newHours) ->
    aux = newHours
    if aux.from.split(":").length == 1
      if aux.from.length == 1
        aux.from = '0' + newHours.from
      aux.from = newHours.from + ':00'

    if aux.to.split(":").length == 1
      if aux.to.length == 1
        aux.to = '0' + newHours.to
      aux.to = newHours.to + ':00'

    pattern = RegExp(/^([01]?[0-9]|2[0-3]):[0-5][0-9]$/)
    pattern.test(aux.from) && pattern.test(aux.to) && @_hourToDate(aux.from) < @_hourToDate(aux.to)

  @_passAdvanceCheck = (newHours, day) ->
    @workCalendar.workableHoursFor(day) == [] ||
    _.every(@workCalendar.workableHoursFor(day), (hour) => !@_hoursInRange(newHours, hour))

  @_hoursInRange = (newHours, hour) ->
    newFrom = @_hourToDate(newHours.from)
    newTo = @_hourToDate(newHours.to)
    hourFrom = @_hourToDate(hour.from)
    hourTo = @_hourToDate(hour.to)

    (newFrom <= hourFrom && newTo >= hourFrom && newTo <= hourTo) || # rodeo al from
    (newFrom >= hourFrom && newFrom <= hourTo && newTo >= hourTo) || # rodeo al to
    (newFrom <= hourFrom && newTo >= hourTo)                      || # rodeo tod0
    (newFrom > hourFrom  && newTo < hourTo)                          # estoy en el medio

  @_update = ->
    debugger
    dentist.hours_to_remove = @hoursToRemove
    dentist.days_to_remove = @daysToRemove
    dentist.update().then(
      (success) =>
        @_notifyOk()
      (error) =>
        for key_error in Object.keys(error.data)
          errorHandler.error(error.data[key_error][0])
    )

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

  @_notifyOk = ->
    errorHandler.success("Se guardaron los horarios correctamente")
    $uibModalInstance.dismiss()

  @_hourToDate = (stringHour) ->
    new Date('2000, 1, 1 ' + stringHour)

  @
)