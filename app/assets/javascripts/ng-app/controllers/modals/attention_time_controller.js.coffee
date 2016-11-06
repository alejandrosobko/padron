angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, WorkCalendar, errorHandler) ->
  @dentist = dentist
  @workCalendar = dentist.getWorkCalendar()
  @newWorkableHours = {}
  @hoursToRemove = []

  @cancel = ->
    $uibModalInstance.dismiss()

  @addHoursFor = (day) ->
    @workCalendar.updateDay(day, @newWorkableHours[day]) if @_validHours(day)
    @newWorkableHours[day] = {}

  @_validHours = (day) ->
    from = parseInt(@newWorkableHours[day]['from'])
    to = parseInt(@newWorkableHours[day]['to'])
    @newWorkableHours[day] && from > 0 && from <= 24 && to > 0 && to <= 24 && from < to

  @save = ->
    dentist.workCalendar = @workCalendar
    if dentist.id
      @_update()
    else
      $uibModalInstance.dismiss()

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