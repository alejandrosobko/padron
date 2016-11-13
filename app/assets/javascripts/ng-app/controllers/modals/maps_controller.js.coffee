angular.module('padronApp').controller('MapsCtrl', ($rootScope, $uibModalInstance, dentist, index) ->
  @dentist = dentist
  @index = index

  # Hack for this: https://github.com/allenhwkim/angularjs-google-maps/issues/82
  $rootScope.$on 'mapInitialized', (event, map) ->
    google.maps.event.trigger(map, 'resize')

  @close = -> $uibModalInstance.dismiss()

  @institute = -> @dentist.institutes[@index].name

  @street = -> @dentist.institutes[@index].street

  @number = -> @dentist.institutes[@index].number

  @location = -> @dentist.institutes[@index].location


  @
)