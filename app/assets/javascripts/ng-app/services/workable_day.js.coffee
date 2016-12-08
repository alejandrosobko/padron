angular.module('padronApp').factory('WorkableDay', ->
  WorkableDay = () ->
    @workableHours = []
    @

  # Por ahora solo sirve para tener una lista de workable hours
  WorkableDay.build = (response) ->
    workableDay = angular.extend(new WorkableDay, response)
    workableDay


  WorkableDay
)