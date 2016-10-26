angular.module('padronApp').factory('WorkableDay', ['WorkableHour', (WorkableHour) ->
  WorkableDay = (day, hours, id) ->
    @day = day
    @workable_hours_attributes = hours
    @id = id
    @

  WorkableDay.build = (data) ->
    new WorkableDay(data.day, WorkableHour.apiResponseTransformer(data), data.id)

  WorkableDay.apiResponseTransformer = (data) ->
    if angular.isArray(data)
      data.map(WorkableDay.build)
    else
      WorkableDay.build(data)

  WorkableDay.prototype.addHours = (hours) ->
    @workable_hours_attributes.push(new WorkableHour(hours['from'], hours['to']))

  WorkableDay
])