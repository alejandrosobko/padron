angular.module('padronApp').factory('WorkableDay', ['WorkableHour', (WorkableHour) ->
  WorkableDay = (day, hours) ->
    @day = day
    @workableHours = hours
    @

  WorkableDay.build = (data) ->
    new WorkableDay(data.day, data.workable_hours.map((d) -> WorkableHour.build(d)))

  WorkableDay
])