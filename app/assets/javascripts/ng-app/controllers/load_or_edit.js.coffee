angular.module('myApp').controller('LoadOrEditCtrl', ($scope, $stateParams, visitFactory, dentistFactory) ->
  $scope.days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  $scope.editMode = $stateParams.dentistId
  $scope.dentistToEdit = dentistFactory.get($stateParams.dentistId) if $scope.editMode

  $scope.save = ->
    if $scope.editMode
      dentistFactory.save($scope.dentistToEdit)
)