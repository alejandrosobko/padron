angular.module('padronApp').factory('WorkCalendar', ['WorkableDay', (WorkableDay) ->
  WorkCalendar = (id=undefined, days) ->
    @id = id
    @workable_days_attributes = days || []
    @

  WorkCalendar.build = (data) ->
    new WorkCalendar(data.id, data.workable_days.map((d) -> WorkableDay.build(d)))

  WorkCalendar.prototype.update_day = (day, hours) ->
    dayWanted = @workable_days_attributes.find((workable_day) -> workable_day.day == day)
    if dayWanted
      dayWanted.addHours(hours)
    else
      @workable_days_attributes.push(WorkableDay.build({day: day, workable_hours: hours}))

  WorkCalendar
])