angular.module('padronApp').controller('NewOrEditCtrl', ($stateParams, Dentist, Visit, Visitor, dentistFactory,
                                                         errorHandler, $location, $uibModal, WorkableDay) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = new Dentist
  @newVisit = new Visit
  @newVisitor = new Visitor

  if self.editMode
    dentistFactory.get($stateParams.dentistId,
      (response) -> self.dentistToEdit = Dentist.build(response.data)
      (error) -> errorHandler.error("Ocurrió un error interno obteniendo al odontólogo. Por favor intente nuevamente")
    )

  @update = ->
    if @dentistToEdit.empty()
      errorHandler.warning("Si no ingresa datos luego no podrá filtrar y encontrar al odontólogo")
    else
      dentistFactory.update({dentist: @dentistToEdit},
        (response) ->
          self.dentistToEdit = undefined
          errorHandler.success("Se actualizó el odontólogo correctamente")
          $location.path('/')
        (error) ->
          for key_error in Object.keys(error.data)
            errorHandler.error(error.data[key_error][0])
      )

  @save = ->
    if @dentistToEdit.empty()
      errorHandler.warning("Si no ingresa datos luego no podrá filtrar y encontrar al odontólogo")
    else if !@newVisitor.name || @newVisitor.name.length < 3
      errorHandler.warning("Complete el nombre del visitador")
    else
      @saveDentist(true)

  @saveDentist = (canDelete) ->
    return unless canDelete
    dentist = @dentistToEdit
    work_calendar = {workable_days: [{day: 'Lunes', workable_hours: [{from: 9, to: 18}]}]}
    visit = @newVisit
    visitor = @newVisitor

    dentistFactory.save({dentist, work_calendar, visit, visitor},
      (response) ->
        self.dentistToEdit = self.newVisit = self.newVisitor = {}
        errorHandler.success("Se creó el odontólogo correctamente")
        $location.path('/')
      (error) ->
        for key_error in Object.keys(error.data)
          errorHandler.error(error.data[key_error][0])
    )

  @new_visit = ->
    visit: @newVisit
    visitor: @newVisitor
    dentist: @dentistToEdit

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
    $uibModal.open(
      templateUrl: 'modals/dentist_warning.html'
      controller: 'ModalDentistCtrl as ModalDentistCtrl'
      resolve:
        deleteFunction: -> self.deleteFunction
        dentist: -> self.dentistToEdit
    )

  @deleteFunction = ->
    dentistFactory.delete(self.dentistToEdit.id).then(
      (response) ->
        self.dentistToEdit = undefined
        errorHandler.info("Se borró el odontólogo correctamente")
        $location.path('/')
      (error) -> errorHandler.error("Ocurrió un error interno borrando al odontólogo. Por favor intente nuevamente")
    )

  @viewAttentionTime = ->
    $uibModal.open(
      templateUrl: 'modals/attention_time.html'
      size: 'lg'
      controller: 'AttentionTimeCtrl as AttentionTimeCtrl'
      resolve:
        dentist: -> self.dentistToEdit
        updateFunction: -> self.updateFunction
    )

  @updateFunction = ->
    console.log(self.dentistToEdit)


  @
)