angular.module('padronApp', ['ngAnimate', 'ui.router', 'templates', 'ui.bootstrap', 'angular-growl', 'rails', 'ngMap'])
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
        url: '/nuevo'
       })
      .state('form.edit', {
        url: '/:dentistId/editar'
      })
      .state('other', {
        url: '/other',
        templateUrl: 'other.html'
      })
      .state('show', {
        url: '/:dentistId',
        templateUrl: 'dentist.html',
        controller: 'ShowCtrl as showCtrl'
      })

    $urlRouterProvider.otherwise('/')
    growlProvider.globalTimeToLive(4000)
  )
