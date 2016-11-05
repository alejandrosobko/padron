angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, WorkCalendar) ->
  @dentist = dentist
  @workCalendar = dentist.getWorkCalendar()
  @newWorkableHours = {}
  @hoursToRemove = []

  @cancel = ->
    $uibModalInstance.dismiss()

  @save = ->
    for day of @newWorkableHours
      @workCalendar.updateDay(day, @newWorkableHours[day])
    @dentist.workCalendar = @workCalendar
    if dentist.id
      @_do_update()
    else
      $uibModalInstance.dismiss()

  @_do_update = ->
    @dentist.hours_to_remove = @hoursToRemove
    @dentist.update().then(
      (success) ->
        alert('updated!')
        $uibModalInstance.dismiss()
      (error) -> alert('failed!')
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