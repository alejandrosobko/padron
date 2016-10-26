angular.module('padronApp').factory('Visit', ->
  Visit = (visit_date, observations, visitor, id) ->
    @visit_date = visit_date || new Date()
    @observations = observations
    @visitor = visitor
    @id = id
    @

  Visit.build = (data) ->
    new Visit(data.visit_date, data.observations, data.visitor, data.id)

  Visit.apiResponseTransformer = (data) ->
    if angular.isArray(data)
      data.map(Visit.build)
    else
      Visit.build(data)

  Visit
)