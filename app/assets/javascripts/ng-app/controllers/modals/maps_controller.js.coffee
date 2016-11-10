angular.module('padronApp').controller('MapsCtrl', ($uibModalInstance, dentist, $rootScope) ->
  @dentist = dentist

  # Hack for this: https://github.com/allenhwkim/angularjs-google-maps/issues/82
  $rootScope.$on 'mapInitialized', (event, map) ->
    google.maps.event.trigger(map,'resize')

  @close = ->
    $uibModalInstance.dismiss()


  @
)