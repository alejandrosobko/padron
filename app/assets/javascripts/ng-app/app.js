angular
    .module('myApp', ['ngAnimate', 'ui.router', 'templates', 'ui.bootstrap'])

    .factory('itemsFactory', ['$http', function($http) {
        var o = {
            items: []
        };

        o.getAll = function() {
            $http.get('/items.json').then(function successCallback(response) {
                angular.copy(response.data, o.items);
            });
            return o.items;
        };

        o.addItem = function(item) {
            $http.post('/items.json', item).then(function successCallback(response) {
                o.items.push(response.data);
            });
        };

        o.delete = function(item) {
            var index = o.items.indexOf(item);
            if (index > -1) {
                $http.delete('/items/' + item.id + '.json').then(function successCallback(response) {
                    o.items.splice(index, 1);
                });
            }
        };

        o.showOrHide = function(item) {
            $http.get('/items/' + item.id + '/show_or_hide.json').then(function successCallback(response) {
                  item.show = response.data;
            });
        };

        o.saveItem = function(item) {
            $http.put('/items/' + item.id, item).then(function successCallback(response) {
                item = response.data; // TODO: No anda 
            });
        };

        return o;
    }])

    .config(function ($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('home', {
                url: '/',
                templateUrl: '/assets/home.html',
                controller: 'HomeCtrl',
                resolve: {
                itemPromise: ['itemsFactory', function(itemsFactory){
                    return itemsFactory.getAll();
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
