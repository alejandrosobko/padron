angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, WorkCalendar, updateFunction) ->
  @workCalendar = dentist.getWorkCalendar()
  @newWorkableHours = {}

  @cancel = ->
    $uibModalInstance.dismiss()

  @save = ->
    for day of @newWorkableHours
      @workCalendar.updateDay(day, @newWorkableHours[day])
    dentist.workCalendar = @workCalendar
    updateFunction()
    $uibModalInstance.dismiss()

  @workableHoursFor = (day) ->
    dayWanted = @workCalendar.workableDays.find((workableDay) -> workableDay.day == day)
    if dayWanted then dayWanted.workableHours else []

  @
)