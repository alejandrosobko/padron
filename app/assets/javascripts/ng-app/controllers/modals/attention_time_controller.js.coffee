angular.module('padronApp').controller('AttentionTimeCtrl', ($uibModalInstance, dentist) ->
  @dentist = dentist

  @cancel = ->
    $uibModalInstance.dismiss()

  @save = ->
    $uibModalInstance.dismiss()

  @
)