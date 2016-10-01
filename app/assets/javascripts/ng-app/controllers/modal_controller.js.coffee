angular.module('myApp').controller('ModalCtrl', ($uibModalInstance, dentist, visitFactory, growl) ->
  @items = ['item1', 'item2', 'item3']
  @dentist = dentist
  @visitor = {'name': ''}
  @newVisit = {}
  self = @


  @handleError = (error, errorMessage = null) ->
    error = errorMessage || "Algo salió mal cargando los datos"
    growl.error("<b>Error</b><br> #{error}")

  @ok = ->
    newVisit =
      visit_date: @newVisit.visit_date,
      observations: @newVisit.observations,
      dentist: dentist,
      visitor: @visitor

    visitFactory.save(newVisit,
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