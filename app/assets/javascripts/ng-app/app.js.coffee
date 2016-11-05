angular.module('padronApp', ['ngAnimate', 'ui.router', 'templates', 'ui.bootstrap', 'angular-growl', 'rails'])
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
      .state('show', {
        url: '/:dentistId',
        templateUrl: 'dentist.html',
        controller: 'ShowCtrl as showCtrl'
      })
      .state('other', {
        url: '/other',
        templateUrl: 'other.html'
      })

    $urlRouterProvider.otherwise('/')
    growlProvider.globalTimeToLive(4000)
  )
