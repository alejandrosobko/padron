angular.module('myApp', ['ngAnimate', 'ui.router', 'templates', 'ui.bootstrap'])
    .config(function ($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('dentists', {
                url: '',
                templateUrl: '/assets/home.html',
                controller: 'DentistCtrl',
                resolve: {
                    dentistPromise: ['dentistFactory', function(dentistFactory){
                        return dentistFactory.getAll();
                    }]
                }
            })
            .state('load_or_edit', {
                url: '',
                templateUrl: 'forms/load_or_edit.html',
                controller: 'LoadOrEditCtrl'
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
