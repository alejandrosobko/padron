angular.module('myApp').controller('DentistCtrl', (dentistFactory, growl) ->
  self = @
  @dentists = []
  @errors = []

  @handleError = (error) ->
    growl.error("<b>Error</b><br> Algo salió mal cargando los datos")
    console.log(error.statusText)

  dentistFactory.getAll(
    (response) ->
      self.dentists = response.data
    (error) -> self.handleError(error)
  )

  @
)