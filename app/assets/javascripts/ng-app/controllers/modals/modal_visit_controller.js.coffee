angular.module('myApp').controller('ModalCtrl', ($uibModalInstance, dentist, Visit, Visitor, dentistFactory, errorHandler) ->
  @newVisitor = new Visitor
  @newVisit = new Visit
  self = @

  @ok = (valid) ->
    return unless valid
    visit = @newVisit
    visitor = @newVisitor
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