angular.module('myApp').controller('ModalCtrl', ($uibModalInstance, dentist, Visit, Visitor, dentistFactory, growl) ->
  @items = ['item1', 'item2', 'item3']
  @visitor = {'name': ''}
  @newVisit = {}
  self = @

  @handleError = (error, errorMessage = null) ->
    error = errorMessage || "Algo salió mal cargando los datos"
    growl.error("<b>Error</b><br> #{error}")

  @ok = ->
    visit = Visit.build(@newVisit)
    visitor = Visitor.build(@visitor)

    dentistFactory.create_visit({visit, visitor, dentist},
      (response) ->
        self.visit = self.visitor = {}
        growl.success('<b>Perfecto</b><br> Se registró una nueva visita')
        $uibModalInstance.dismiss()
      (error) -> self.handleError(error)
    )

  @cancel = ->
    $uibModalInstance.dismiss()

  @
)