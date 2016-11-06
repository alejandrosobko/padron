angular.module('padronApp').controller('ShowCtrl', ($stateParams, Dentist, $uibModal, errorHandler, $location) ->
  @dentist = undefined

  Dentist.get(id: $stateParams.dentistId).then(
    (dentist) => @dentist = dentist
    (error) => alert('failed')
  )

  @getDateFor = (visit) ->
    new Date(visit.visitDate)

  @delete = ->
    $uibModal.open(
      templateUrl: 'modals/dentist_warning.html'
      controller: 'ModalDentistCtrl as ModalDentistCtrl'
      resolve:
        deleteFunction: => @deleteFunction
        dentist: => @dentist
    )

  @deleteFunction = =>
    @dentist.delete({id: @dentist.id}).then(
      (response) =>
        @dentist = new Dentist
        errorHandler.info("Se borró el odontólogo correctamente")
        $location.path('/')
      (error) => errorHandler.error("Ocurrió un error interno borrando al odontólogo. Por favor intente nuevamente")
    )

  @
)