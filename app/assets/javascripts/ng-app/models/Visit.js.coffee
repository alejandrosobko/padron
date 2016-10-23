angular.module('padronApp').factory('Visit', ->
  Visit = (id, visit_date, observations, visitor) ->
    @id = id
    @visit_date = visit_date || new Date()
    @observations = observations
    @visitor = visitor

  Visit.build = (data) ->
    new Visit(data.id, data.visit_date, data.observations, data.visitor)

  Visit
)