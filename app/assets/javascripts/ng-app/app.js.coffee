angular.module('myApp', ['ngAnimate', 'ui.router', 'templates', 'ui.bootstrap', 'angular-growl'])
  .config(($stateProvider, $urlRouterProvider, growlProvider) ->
    $stateProvider
      .state('dentists', {
        url: '/',
        templateUrl: '/assets/home.html',
        controller: 'DentistCtrl as dentistCtrl'
      })
      .state('form', {
        abstract: true,
        url: '',
        templateUrl: 'forms/new_or_edit.html'
      })
      .state('form.new', {
        url: '/nuevo',
        controller: 'NewOrEditCtrl as newOrEdit'
       })
      .state('form.edit', {
        url: '/editar/:dentistId',
        controller: 'NewOrEditCtrl as newOrEdit'
      })

    $urlRouterProvider.otherwise('/')
    growlProvider.globalTimeToLive(4000)
  )
