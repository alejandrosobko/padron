angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, WorkCalendar, errorHandler) ->
  @dentist = dentist
  @workCalendar = dentist.getWorkCalendar()
  @newWorkableHours = {}
  @hoursToRemove = []
  @daysToRemove = []
  @canSave = true

  @cancel = ->
    $uibModalInstance.dismiss()

  # plus button
  @addHoursFor = (day) -> # TODO: Please fix this asap!!!
    return unless @newWorkableHours[day]
    @_checkHours()
    return unless @newWorkableHours[day]
    if @canSave
      @workCalendar.updateDay(day, @newWorkableHours[day])
      @newWorkableHours[day] = undefined
    else
      errorHandler.error("Hay horarios incorrectos")

  # save button
  @save = ->
    @_checkHours()
    if @canSave
      @_addHoursNotPushed()
      dentist.workCalendar = @workCalendar
      if dentist.id
        @_update()
      else
        @_notifyOk()
    else
      errorHandler.error("Hay horarios incorrectos")

  @_checkHours = ->
    @canSave = _.every(['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'], (day) =>
      return true unless @newWorkableHours[day] # For empty values
      if @newWorkableHours[day]['from'] == "" || @newWorkableHours[day]['to'] == ""
        @newWorkableHours[day] = undefined
        return true
      from = parseInt(@newWorkableHours[day]['from'])
      to = parseInt(@newWorkableHours[day]['to'])
      from > 0 && from <= 24 && to > 0 && to <= 24 && from < to
    )

  @_addHoursNotPushed = -> # TODO: Recorrer solo las keys de @newWorkableHours
    _.each(['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'], (day) => @addHoursFor(day))

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

  @workableHoursFor = (day) ->
    dayWanted = @workCalendar.workableDays.find((workableDay) -> workableDay.day == day)
    if dayWanted then dayWanted.workableHours else []

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