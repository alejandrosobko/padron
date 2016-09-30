angular.module('myApp').controller('ModalCtrl', ($uibModalInstance, dentist) ->

  @items = ['item1', 'item2', 'item3']
  @dentist = dentist

  @ok = ->
    $uibModalInstance.dismiss()

  @cancel = ->
    $uibModalInstance.dismiss()

  @
)