angular.module('padronApp').controller('DentistCtrl', (Dentist, dentistFactory, errorHandler, $uibModal) ->
  self = @
  @dentists = []
  @fieldToOrder = 'surname'
  @reversed = false

  dentistFactory.getAll(
    (response) -> self.dentists = response.data.map((d) -> Dentist.build(d))
    (error) -> errorHandler.error("Algo salió mal cargando a los dentistas. Intente nuevamente")
  )

  @openModal = (dentist) ->
    $uibModal.open(
      templateUrl: 'modals/new_visit.html'
      controller: 'ModalCtrl as ModalCtrl'
      resolve:
        dentist: -> dentist
    )

  @orderBy = (field) ->
    @fieldToOrder = field
    @reversed = !@reversed


  @
)