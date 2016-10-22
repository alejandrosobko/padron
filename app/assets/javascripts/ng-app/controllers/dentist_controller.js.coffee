angular.module('myApp').controller('DentistCtrl', (Dentist, dentistFactory, growl, $uibModal) ->
  self = @
  @dentists = []
  @fieldToOrder = 'surname'
  @reversed = false

  @handleError = (error) ->
    growl.error("<b>Error</b><br> Algo salió mal cargando los datos")
    console.log(error.statusText)

  dentistFactory.getAll(
    (response) -> self.dentists = response.data.map((d) -> Dentist.build(d))
    (error) -> self.handleError(error)
  )

  @openModal = (dentist) ->
    $uibModal.open(
      templateUrl: 'extras/modal.html'
      controller: 'ModalCtrl as ModalCtrl'
      resolve: {
        dentist: ->
          dentist
      }
    )

  @orderBy = (field) ->
    @fieldToOrder = field
    @reversed = !@reversed


  @
)