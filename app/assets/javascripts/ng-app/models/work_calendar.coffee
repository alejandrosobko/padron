angular.module('padronApp').factory('WorkCalendar', ['WorkableDay', (WorkableDay) ->
  WorkCalendar = (days) ->
    @workableDays = days
    @

  WorkCalendar.build = (data) ->
    new WorkCalendar(data.workable_days.map((d) -> WorkableDay.build(d)))

  WorkCalendar
])