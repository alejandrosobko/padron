angular.module('padronApp').factory('WorkableDay', ['WorkableHour', (WorkableHour) ->
  WorkableDay = (id=undefined, day, hours) ->
    @id = id
    @day = day
    @workable_hours_attributes = hours
    @

  WorkableDay.build = (data) ->
    new WorkableDay(data.id, data.day, data.workable_hours.map((d) -> WorkableHour.build(d)))

  WorkableDay.prototype.addHours = (hours) ->
    @workable_hours_attributes.push(new WorkableHour(hours['from'], hours['to']))

  WorkableDay
])