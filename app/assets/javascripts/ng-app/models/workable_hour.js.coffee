angular.module('padronApp').factory('WorkableHour', ->
  WorkableHour = (from, to, id) ->
    @from = from
    @to = to
    @id = id
    @

  WorkableHour.build = (data) ->
    new WorkableHour(data.from, data.to, data.id)

  WorkableHour.apiResponseTransformer = (data) ->
    if angular.isArray(data)
      data.map(WorkableHour.build)
    else
      WorkableHour.build(data)

  WorkableHour
)