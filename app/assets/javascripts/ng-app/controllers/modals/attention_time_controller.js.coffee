angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist, updateFunction) ->
  @dentist = dentist
  @new_workable_hours = {}

  @cancel = ->
    $uibModalInstance.dismiss()

  @save = ->
    for day of @new_workable_hours
      @dentist.work_calendar_attributes.update_day(day, @new_workable_hours[day])
    updateFunction()
    $uibModalInstance.dismiss()

  @workable_hours_for = (day) ->
    dayWanted = @dentist.work_calendar_attributes.workable_days_attributes.find((workable_day) -> workable_day.day == day)
    if dayWanted then dayWanted.workable_hours_attributes else []

  @
)