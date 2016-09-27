angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, visitFactory, dentistFactory, $location, growl) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = {}

  @handleError = (error, errorMessage=null) ->
    if errorMessage
      growl.error("<b>Error</b><br> #{errorMessage}")
    else
      growl.error("<b>Error</b><br> Algo salió mal cargando los datos")

  dentistFactory.get($stateParams.dentistId,
    (response) ->
      if self.editMode
        self.dentistToEdit = response.data
    (error) -> self.handleError(error, "No se pudo obtener al usuario")
  )

  @update = ->
    if @editMode
      dentistFactory.update(@dentistToEdit,
        (response) ->
          growl.success('Guardado correctamente')
          $location.path('/')
        (error) -> self.handleError(error)
      )

  @
)