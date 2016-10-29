angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, WorkCalendar, updateFunction) ->
  @dentist = dentist
  @workCalendar = dentist.getWorkCalendar()
  @newWorkableHours = {}

  @cancel = ->
    $uibModalInstance.dismiss()

  @save = ->
    for day of @newWorkableHours
      @workCalendar.updateDay(day, @newWorkableHours[day])
    dentist.workCalendar = @workCalendar
    updateFunction() if dentist.id
    $uibModalInstance.dismiss()

  @workableHoursFor = (day) ->
    dayWanted = @workCalendar.workableDays.find((workableDay) -> workableDay.day == day)
    if dayWanted then dayWanted.workableHours else []

  @removeHourFrom = (day, hoursIndex) ->
    dayWanted = @workCalendar.workableDays.find((workableDay) -> workableDay.day == day)
    if (hoursIndex > -1)
      dayWanted.workableHours.splice(hoursIndex, 1)


  @
)