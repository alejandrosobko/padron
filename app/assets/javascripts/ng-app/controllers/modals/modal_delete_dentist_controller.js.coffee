angular.module('padronApp').controller('ModalDeleteDentistCtrl', ($uibModalInstance, dentist, deleteFunction) ->
  @dentistFullName = (dentist.surname + " " + dentist.name).replace("null", "")

  @cancel = ->
    $uibModalInstance.dismiss()

  @delete = ->
    $uibModalInstance.dismiss()
    deleteFunction()

  @
)