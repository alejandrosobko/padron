angular.module('myApp').controller('ModalDentistCtrl', ($uibModalInstance, dentist, deleteFunction) ->
  @dentistFullName = (dentist.name + " " + dentist.surname).replace("null", "")

  @cancel = ->
    $uibModalInstance.dismiss()

  @delete = ->
    $uibModalInstance.dismiss()
    deleteFunction()

  @
)