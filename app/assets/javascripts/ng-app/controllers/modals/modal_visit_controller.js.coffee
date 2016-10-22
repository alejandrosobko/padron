angular.module('myApp').controller('ModalCtrl', ($uibModalInstance, dentist, Visit, Visitor, dentistFactory, errorHandler) ->
  @visitor = new Visitor
  @newVisit = new Visit
  self = @

  @ok = ->
    visit = @newVisit
    visitor = @visitor

    dentistFactory.create_visit({visit, visitor, dentist},
      (response) ->
        self.visit = self.visitor = {}
        errorHandler.success("Se registró la visita correctamente")
        $uibModalInstance.dismiss()
      (error) -> errorHandler.error("Ocurrió un error registrando la visita. Por favor intente nuevamente")
    )

  @cancel = ->
    $uibModalInstance.dismiss()

  @
)