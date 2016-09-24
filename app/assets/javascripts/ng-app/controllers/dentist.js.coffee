angular.module('myApp').controller('DentistCtrl', ($scope, dentistFactory) ->
  $scope.dentists = dentistFactory.getAll()

  $scope.removeToView = ->
    $scope.toView = null
)