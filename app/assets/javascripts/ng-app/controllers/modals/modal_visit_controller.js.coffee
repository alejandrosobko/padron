angular.module('padronApp').controller('ModalCtrl', ($uibModalInstance, dentist, Dentist, errorHandler) ->
  @newVisit = {visitDate: new Date}
  @newVisitor = {}
  self = @

  @ok = (valid) ->
    return unless valid
    @newVisit.visitor = @newVisitor
    dentist.visits.push(@newVisit)
    Dentist.get(dentist.id).then((dentist) ->
      dentist.visits.push(self.newVisit)
      dentist.update().then(
        (response) ->
          errorHandler.success("Se registró la visita correctamente")
          $uibModalInstance.dismiss()
        (error) -> errorHandler.error("Ocurrió un error registrando la visita. Por favor intente nuevamente")
      )
    )

  @cancel = ->
    $uibModalInstance.dismiss()

  @
)