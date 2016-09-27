angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, visitFactory, dentistFactory) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = {}

  dentistFactory.get($stateParams.dentistId,
    (response) -> if self.editMode then self.dentistToEdit = response.data else {},
    (error) -> self.handleError(error)
  )

  @update = ->
    if @editMode
      dentistFactory.update(@dentistToEdit,
        (error) -> self.handleError(error)
      )

  @handleError = (error) ->
    console.log(error)


  @
)