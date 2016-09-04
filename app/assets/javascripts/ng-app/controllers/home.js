angular.module('myApp')
    .controller('DentistCtrl', function ($scope, dentistFactory) {
    
        $scope.dentists = dentistFactory.getAll();

    });