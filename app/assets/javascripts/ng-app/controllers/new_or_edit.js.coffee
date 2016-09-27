angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, visitFactory, dentistFactory, $location, growl) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = {}

  @handleError = (error) ->
    growl.error("<b>Error</b><br> Algo salió mal cargando los datos")
    console.log(error)

  dentistFactory.get($stateParams.dentistId,
    (response) ->
      if self.editMode
        self.dentistToEdit = response.data
    (error) -> self.handleError(error)
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