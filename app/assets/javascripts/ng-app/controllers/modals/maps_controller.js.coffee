angular.module('padronApp').controller('MapsCtrl', ($rootScope, $uibModalInstance, dentist, index) ->
  @dentist = dentist
  @index = index

  # Hack for this: https://github.com/allenhwkim/angularjs-google-maps/issues/82
  $rootScope.$on 'mapInitialized', (event, map) ->
    google.maps.event.trigger(map, 'resize')

  @close = -> $uibModalInstance.dismiss()

  @institution = -> @dentist.institutions[@index]

  @street = -> @dentist.streets[@index]

  @number = -> @dentist.numbers[@index]

  @location = -> @dentist.locations[@index]


  @
)