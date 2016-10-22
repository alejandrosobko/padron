angular.module('myApp').controller('ModalCtrl', ($uibModalInstance, dentist, Visit, Visitor, dentistFactory, errorHandler) ->
  @items = ['item1', 'item2', 'item3']
  @visitor = {'name': ''}
  @newVisit = {}
  self = @

  @ok = ->
    visit = Visit.build(@newVisit)
    visitor = Visitor.build(@visitor)

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