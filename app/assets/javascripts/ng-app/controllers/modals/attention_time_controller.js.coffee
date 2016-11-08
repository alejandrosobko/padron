angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, WorkCalendar, errorHandler) ->
  @dentist = dentist
  @workCalendar = dentist.getWorkCalendar()
  @newWorkableHours = {}
  @hoursToRemove = []
  @canSave = true

  @cancel = ->
    $uibModalInstance.dismiss()

  @addHoursFor = (day) ->
    return unless @newWorkableHours[day]
    if @_validHours(day)
      @workCalendar.updateDay(day, @newWorkableHours[day])
      @newWorkableHours[day] = {}
      @canSave = true
    else
      errorHandler.error("El horario es incorrecto")
      @canSave = false

  @_validHours = (day) ->
    from = parseInt(@newWorkableHours[day]['from'])
    to = parseInt(@newWorkableHours[day]['to'])
    @newWorkableHours[day] && from > 0 && from <= 24 && to > 0 && to <= 24 && from < to

  @save = ->
    @_addHoursNotPushed()
    dentist.workCalendar = @workCalendar
    @_update() if dentist.id && @canSave

  @_addHoursNotPushed = ->
    _.each(['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'], (day) => @addHoursFor(day))

  @_update = ->
    dentist.hours_to_remove = @hoursToRemove
    dentist.update().then(
      (success) ->
        errorHandler.success("Se guardaron los horarios correctamente")
        $uibModalInstance.dismiss()
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


  @
)