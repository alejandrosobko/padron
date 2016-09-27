angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, dentistFactory, $location, growl) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = {}

  @handleError = (error, errorMessage=null) ->
    error = errorMessage || "Algo salió mal cargando los datos"
    growl.error("<b>Error</b><br> #{error}")

  if self.editMode
    dentistFactory.get($stateParams.dentistId,
      (response) -> self.dentistToEdit = response.data
      (error) -> self.handleError(error, "No se pudo obtener al odontólogo")
    )

  @update = ->
    if @editMode
      dentistFactory.update(@dentistToEdit,
        (response) ->
          self.dentistToEdit = {}
          growl.success('Guardado correctamente')
          $location.path('/')
        (error) -> self.handleError(error)
      )

  @removeToView = ->
    $location.path('/')
    self.dentistToEdit = {}

  @
)