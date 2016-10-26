angular.module('padronApp').factory('WorkCalendar', ['WorkableDay', (WorkableDay) ->
  WorkCalendar = (days, id) ->
    @workable_days_attributes = days || []
    @id = id
    @

  WorkCalendar.build = (data) ->
    new WorkCalendar(WorkableDay.apiResponseTransformer(data), data.id)

  WorkCalendar.apiResponseTransformer = (data) ->
    if angular.isArray(data)
      data.map(WorkCalendar.build)
    else
      WorkCalendar.build(data)

  WorkCalendar.prototype.update_day = (day, hours) ->
    dayWanted = @workable_days_attributes.find((workable_day) -> workable_day.day == day)
    if dayWanted
      dayWanted.addHours(hours)
    else
      @workable_days_attributes.push(WorkableDay.build({day: day, workable_hours: hours}))

  WorkCalendar.prototype.empty = ->
    @workable_days_attributes.length == 0


  WorkCalendar
])