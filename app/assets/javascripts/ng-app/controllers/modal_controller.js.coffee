angular.module('myApp').controller('ModalCtrl', ($uibModalInstance, dentist, dentistFactory, growl) ->
  @items = ['item1', 'item2', 'item3']
  @dentist = dentist
  @visitor = {'name': ''}
  @newVisit = {}
  self = @

  @handleError = (error, errorMessage = null) ->
    error = errorMessage || "Algo salió mal cargando los datos"
    growl.error("<b>Error</b><br> #{error}")

  @ok = ->
    visit = {visit_date: @newVisit.visit_date, observations: @newVisit.observations}
    visitor = @visitor
    dentist = dentist

    dentistFactory.create_visit({visit, visitor, dentist},
      (response) ->
        self.visit = {}
        growl.success('<b>Perfecto</b><br> Se registró una nueva visita')
        $uibModalInstance.dismiss()
      (error) -> self.handleError(error)
    )

  @cancel = ->
    $uibModalInstance.dismiss()

  @
)