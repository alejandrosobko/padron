angular.module('myApp').controller('DentistCtrl', (dentistFactory) ->
  self = @
  @dentists = []
  @errors = []

  @handleError = (error) ->
    console.log(error.statusText)

  dentistFactory.getAll(
    (response) -> self.dentists = response.data
    (error) -> self.handleError(error)
  )

  @removeToView = ->
    @toView = null

  @
)