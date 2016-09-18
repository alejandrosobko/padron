angular.module('myApp')
    .factory('dentistFactory', ['$http', function ($http) {
        var o = {
            dentists: []
        };

        o.getAll = function () {
            $http.get('/dentists.json').then(
                function successCallback(response) {
                    angular.copy(response.data, o.dentists)
                }, function errorCallback(error) {
                    console.log("Error getting all dentists: " + error);
                });
            return o.dentists;
        };

        o.addDentist = function (dentist) {
            $http.post('/dentists.json', dentist).then(
                function successCallback(response) {
                    o.dentists.push(response.data);
                }, function errorCallback(error) {
                    console.log("Error adding a dentist: " + error);
                });
        };

        o.delete = function (dentist) {
            var index = o.dentists.indexOf(dentist);
            if (index > -1) {
                $http.delete('/dentists/' + dentist.id + '.json').then(
                    function successCallback() {
                        o.dentists.splice(index, 1);
                    }, function errorCallback(error) {
                        console.log("Error deleting a dentist: " + error);
                    });
            }
        };

        o.saveDentist = function (dentist) {
            $http.put('/dentists/' + dentist.id, dentist).then(
                function successCallback(response) {
                    dentist = response.data;
                }, function errorCallback(error) {
                    console.log("Error saving a dentist: " + error);
                });
        };

        return o;
    }]);