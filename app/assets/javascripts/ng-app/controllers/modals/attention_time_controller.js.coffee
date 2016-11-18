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
      if !@newWorkableHours[day] || @newWorkableHours[day]['from'] == "" || @newWorkableHours[day]['to'] == ""
        @newWorkableHours[day] = undefined # to not save empty hours
        return true
      from = parseInt(@newWorkableHours[day]['from'])
      to = parseInt(@newWorkableHours[day]['to'])
      @_passSimpleCheck(from, to) && @_passAdvanceCheck(from, to, day)
    )

  @_passSimpleCheck = (from, to) ->
    (from > 0 && from <= 24) && (to > 0 && to <= 24) && (from < to)

  @_passAdvanceCheck = (from, to, day) ->
    @workCalendar.workableHoursFor(day) == [] ||
    _.every(@workCalendar.workableHoursFor(day), (hour) => !@_hoursInRange(from, to, hour))

  @_hoursInRange = (from, to, hours) ->
    (from <= hours['from'] && to >= hours['from'] && to <= hours['to']) || # rodeo al from
    (from >= hours['from'] && from <= hours['to'] && to >= hours['to']) || # rodeo al to
    (from <= hours['from'] && to >= hours['to'])                        || # rodeo tod0
    (from > hours['from']  && to < hours['to'])                            # estoy en el medio

  @_update = ->
    dentist.hours_to_remove = @hoursToRemove
    dentist.days_to_remove = @daysToRemove
    dentist.update().then(
      (success) =>
        @_notifyOk()
      (error) =>
        for key_error in Object.keys(error.data)
          errorHandler.error(error.data[key_error][0])
    )

  @removeHourFrom = (day, hoursIndex) ->
    dayWanted = @workCalendar.workableDays.find((workableDay) -> workableDay.day == day)
    if (hoursIndex > -1)
      @hoursToRemove.push(dayWanted.workableHours[hoursIndex].id)
      dayWanted.workableHours.splice(hoursIndex, 1)
      if dayWanted.workableHours.length == 0
        @daysToRemove.push(dayWanted.id)
        dayIndex = @workCalendar.workableDays.indexOf(dayWanted)
        @workCalendar.workableDays.splice(dayIndex, 1)

  @_notifyOk = ->
    errorHandler.success("Se guardaron los horarios correctamente")
    $uibModalInstance.dismiss()


  @
)