angular.module('myApp').controller('LoadOrEditCtrl', ($scope, $stateParams, visitFactory, dentistFactory) ->
  $scope.days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  $scope.editMode = $stateParams.dentistId
  $scope.dentistToEdit = {}

  if $scope.editMode
    dentistFactory.get($stateParams.dentistId).then((response) -> $scope.dentistToEdit = response)

  $scope.save = ->
    if $scope.editMode
      dentistFactory
)