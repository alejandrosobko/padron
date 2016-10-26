angular.module('padronApp').factory('Visitor', ->
  Visitor = (name, id) ->
    @name = name
    @id = id
    @

  Visitor.build = (data) ->
    new Visitor(data.name, data.id)

  Visitor.apiResponseTransformer = (data) ->
    if angular.isArray(data)
      data.map(Visitor.build)
    else
      Visitor.build(data)

  Visitor
)