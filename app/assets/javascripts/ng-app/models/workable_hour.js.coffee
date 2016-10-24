angular.module('padronApp').factory('WorkableHour', ->
  WorkableHour = (from, to) ->
    @from = from
    @to = to
    @

  WorkableHour.build = (data) ->
    new WorkableHour(data.from, data.to)

  WorkableHour
)