angular
    .module('myApp', ['ngAnimate', 'ui.router', 'templates', 'ui.bootstrap'])

    .factory('dentistFactory', ['$http', function($http) {
        var o = {
            dentists: []
        };

        o.getAll = function() {
            $http.get('/dentists.json').then(function successCallback(response) {
                angular.copy(response.data, o.dentists);
            });
            return o.dentists;
        };

        o.addDentist = function(dentist) {
            $http.post('/dentists.json', dentist).then(function successCallback(response) {
                o.dentists.push(response.data);
            });
        };

        o.delete = function(dentist) {
            var index = o.dentists.indexOf(dentist);
            if (index > -1) {
                $http.delete('/dentists/' + dentist.id + '.json').then(function successCallback() {
                    o.dentists.splice(index, 1);
                });
            }
        };

        o.saveDentist = function(dentist) {
            $http.put('/dentists/' + dentist.id, dentist).then(function successCallback(response) {
                dentist = response.data;
            });
        };

        return o;
    }])

    .config(function ($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('dentists', {
                url: '/',
                templateUrl: '/assets/home.html',
                controller: 'DentistCtrl',
                resolve: {
                    dentistPromise: ['dentistFactory', function(dentistFactory){
                        return dentistFactory.getAll();
                    }]
                }
            })
            .state('dashboard', {
                abstract: true,
                url: '/dashboard',
                templateUrl: 'dashboard/layout.html'
            })
            .state('dashboard.one', {
                url: '',
                templateUrl: 'dashboard/one.html'
            })
            .state('dashboard.two', {
                url: '/two',
                templateUrl: 'dashboard/two.html'
            })
            .state('dashboard.three', {
                url: '/three',
                templateUrl: 'dashboard/three.html'
            });


        $urlRouterProvider.otherwise('/');

    });
