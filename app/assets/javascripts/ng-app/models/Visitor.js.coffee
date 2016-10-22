angular.module('myApp').factory('Visitor', ->
  Visitor = (id, name) ->
    @id = id
    @name = name

  Visitor.build = (data) ->
    new Visitor(data.id, data.name)

  Visitor
)