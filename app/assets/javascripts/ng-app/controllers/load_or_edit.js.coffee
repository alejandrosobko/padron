angular.module('myApp').controller('LoadOrEditCtrl', ($scope, $stateParams, visitFactory) ->
  $scope.days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  $scope.editMode = $stateParams.dentistId
  $scope.visitToEdit = visitFactory.getByDentistId($stateParams.dentistId) if $scope.editMode
)