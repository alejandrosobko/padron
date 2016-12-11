angular.module('padronApp').controller('ModalDeleteDentistCtrl', ($uibModalInstance, dentist, deleteFunction) ->
  @dentistFullName = (dentist.name + " " + dentist.surname).replace("null", "")

  @cancel = ->
    $uibModalInstance.dismiss()

  @delete = ->
    $uibModalInstance.dismiss()
    deleteFunction()

  @
)