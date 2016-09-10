angular.module('myApp')
    .controller('DentistCtrl', function ($scope, dentistFactory) {
    
        $scope.dentists = dentistFactory.getAll();
        $scope.toView = null;

        $scope.viewOnly = function(dentist) {
            $scope.toView = dentist;
        };

        $scope.removeToView = function () {
            $scope.toView = null;
        }

    });