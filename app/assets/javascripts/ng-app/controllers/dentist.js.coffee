angular.module('myApp').controller('DentistCtrl', (dentistFactory) ->
  @dentists = dentistFactory.getAll()

  @removeToView = ->
    @toView = null

  @
)