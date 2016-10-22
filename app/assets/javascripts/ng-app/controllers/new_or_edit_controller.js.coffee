angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, Dentist, Visit, Visitor, dentistFactory, errorHandler, $location) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = {}
  @newVisit = {}
  @newVisitor = {}

  if self.editMode
    dentistFactory.get($stateParams.dentistId,
      (response) -> self.dentistToEdit = response.data
      (error) -> errorHandler.error("Ocurrió un error interno obteniendo al odontólogo. Por favor intente nuevamente")
    )

  @update = ->
    return unless @editMode
    @dentistToEdit.checkErrors(errorHandler.error("completar"))
    dentistFactory.update(@dentistToEdit,
      (response) ->
        self.dentistToEdit = undefined
        errorHandler.success("Se actualizó el odontólogo correctamente")
        $location.path('/')
      (error) -> errorHandler.error("Ocurrió un error interno guardando la información. Por favor intente nuevamente")
    )

  @save = ->
    dentist = Dentist.build(@dentistToEdit)
    work_calendar = {workable_days: [{day: 'Lunes', workable_hours: [{from: 9, to: 18}]}]}
    visit = Visit.build(@newVisit)
    visitor = Visitor.build(@newVisitor)

    dentistFactory.save({dentist, work_calendar, visit, visitor},
      (response) ->
        self.dentistToEdit = self.newVisit = self.newVisitor = {}
        errorHandler.success("Se creó el odontólogo correctamente")
        $location.path('/')
      (error) -> errorHandler.error("Ocurrió un error interno creando al odontólogo. Por favor intente nuevamente")
    )

  @new_visit = ->
    visit: Visit.build(@newVisit)
    visitor: Visitor.build(@newVisitor)
    dentist: Dentist.build(@dentistToEdit)

    dentistFactory.create_visit({dentist, visit, visitor},
      (response) ->
        self.dentistToEdit = self.newVisit = self.newVisitor = {}
        errorHandler.success("Se registró la visita correctamente")
        $location.path('/')
      (error) -> errorHandler.error("Ocurrió un error interno creando la visita. Por favor intente nuevamente")
    )

  @removeToView = ->
    $location.path('/')
    self.dentistToEdit = undefined

  @delete = ->
    dentistFactory.delete(@dentistToEdit.id).then(
      (response) ->
        self.dentistToEdit = undefined
        errorHandler.info("Se borró el odontólogo correctamente")
        $location.path('/')
      (error) -> errorHandler.error("Ocurrió un error interno borrando al odontólogo. Por favor intente nuevamente")
    )


  @
)