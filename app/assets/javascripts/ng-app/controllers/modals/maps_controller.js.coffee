angular.module('padronApp').controller('MapsCtrl', ($uibModalInstance, dentist) ->
  @dentist = dentist

  @close = ->
    $uibModalInstance.dismiss()


  @
)