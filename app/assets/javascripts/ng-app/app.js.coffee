angular.module('myApp', ['ngAnimate', 'ui.router', 'templates', 'ui.bootstrap', 'angular-growl'])
  .config(($stateProvider, $urlRouterProvider, growlProvider) ->
    $stateProvider
      .state('dentists', {
        url: '/',
        templateUrl: '/assets/home.html',
        controller: 'DentistCtrl as dentist'
      })
      .state('load', {
        url: '/nuevo',
        templateUrl: 'forms/new_or_edit.html',
        controller: 'NewOrEditCtrl as newOrEdit'
       })
      .state('edit', {
        url: '/editar/:dentistId',
        templateUrl: 'forms/new_or_edit.html',
        controller: 'NewOrEditCtrl as newOrEdit'
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
      })

    $urlRouterProvider.otherwise('/')
    growlProvider.globalTimeToLive(4000)
  )
