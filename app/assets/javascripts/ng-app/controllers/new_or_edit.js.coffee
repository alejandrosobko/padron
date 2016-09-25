angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, visitFactory, dentistFactory) ->
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = dentistFactory.get($stateParams.dentistId) if @editMode

  @save = ->
    if @editMode
      dentistFactory.save(@dentistToEdit)

  @
)