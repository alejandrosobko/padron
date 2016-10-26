angular.module('padronApp').factory('WorkableHour', ->
  WorkableHour = (id=undefined, from, to) ->
    @id = id
    @from = from
    @to = to
    @

  WorkableHour.build = (data) ->
    new WorkableHour(data.id, data.from, data.to)

  WorkableHour
)