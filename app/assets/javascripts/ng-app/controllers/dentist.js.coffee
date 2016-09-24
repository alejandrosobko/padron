angular.module('myApp').controller('DentistCtrl', ($scope, dentistFactory) ->

  $scope.dentists = dentistFactory.getAll()
  $scope.toView = null

  $scope.viewOnly = (dentist) ->
    $scope.toView = dentist

  $scope.removeToView = ->
    $scope.toView = null
)