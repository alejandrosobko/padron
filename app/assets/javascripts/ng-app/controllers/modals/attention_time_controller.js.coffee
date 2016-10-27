angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, WorkCalendar, updateFunction) ->
  @dentist = dentist
  @newWorkableHours = {}

  @cancel = ->
    $uibModalInstance.dismiss()

  @save = ->
    workCalendar = WorkCalendar.build(@dentist.workCalendar)
    for day of @newWorkableHours
      workCalendar.updateDay(day, @newWorkableHours[day])
    @dentist.workCalendar = workCalendar
    updateFunction()
    $uibModalInstance.dismiss()

  @workableHoursFor = (day) ->
    dayWanted = @dentist.workCalendar.workableDays.find((workableDay) -> workableDay.day == day)
    if dayWanted then dayWanted.workableHours else []

  @
)