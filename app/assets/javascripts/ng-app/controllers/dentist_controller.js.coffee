angular.module('padronApp').controller('DentistCtrl', (Dentist, errorHandler, $uibModal) ->
  @dentists = []
  @fieldToOrder = 'surname'
  @reversed = false

  Dentist.query().then(
    (response) => @dentists = response
    (error) => errorHandler.error("Algo salió mal cargando a los dentistas. Intente nuevamente")
  )

  @openModal = (dentist) ->
    $uibModal.open(
      templateUrl: 'modals/new_visit.html'
      controller: 'ModalCtrl as modalCtrl'
      resolve:
        dentist: -> dentist
    )

  @orderBy = (field) ->
    @fieldToOrder = field
    @reversed = !@reversed


  @
)