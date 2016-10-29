angular.module('padronApp').controller('NewOrEditCtrl', ($stateParams, Dentist, errorHandler, $location, $uibModal) ->
  @editMode = $stateParams.dentistId
  @dentistToEdit = new Dentist
  @newVisit = {visitDate: new Date}
  @newVisitor = {}

  if @editMode
    Dentist.get($stateParams.dentistId).then(
      (response) => @dentistToEdit = response
      (error) => errorHandler.error("Ocurrió un error interno obteniendo al odontólogo. Por favor intente nuevamente")
    )

  @update = =>
    @dentistToEdit.removeEmptyValues()
    if @dentistToEdit.empty()
      errorHandler.warning("Si no ingresa datos luego no podrá filtrar y encontrar al odontólogo")
    else
      @dentistToEdit.update().then(
        (response) =>
          errorHandler.success("Se actualizó el odontólogo correctamente")
          $location.path('/')
        (error) =>
          for key_error in Object.keys(error.data)
            errorHandler.error(error.data[key_error][0])
      )

  @save = ->
    if @dentistToEdit.empty()
      errorHandler.warning("Si no ingresa datos luego no podrá filtrar y encontrar al odontólogo")
    else if !@newVisitor.name || @newVisitor.name.length < 3
      errorHandler.warning("Complete el nombre del visitador")
    else
      @saveDentist()

  @saveDentist = ->
    @newVisit['visitor'] = @newVisitor
    @dentistToEdit.visits = [@newVisit]
    @dentistToEdit.create().then(
      (response) =>
        errorHandler.success("Se creó el odontólogo correctamente")
        $location.path('/')
      (error) =>
        for key_error in Object.keys(error.data)
          errorHandler.error(error.data[key_error][0])
    )

  @new_visit = ->
    @newVisit.visitor = @newVisitor
    @dentistToEdit.visits.push(@newVisit)
    @dentistToEdit.update().then(
      (response) =>
        errorHandler.success("Se registró la visita correctamente")
        $location.path('/')
      (error) => errorHandler.error("Ocurrió un error interno creando la visita. Por favor intente nuevamente")
    )

  @removeToView = -> $location.path('/')

  @delete = ->
    $uibModal.open(
      templateUrl: 'modals/dentist_warning.html'
      controller: 'ModalDentistCtrl as ModalDentistCtrl'
      resolve:
        deleteFunction: => @deleteFunction
        dentist: => @dentistToEdit
    )

  @deleteFunction = =>
    @dentistToEdit.delete({id: @dentistToEdit.id}).then(
      (response) =>
        @dentistToEdit = new Dentist
        errorHandler.info("Se borró el odontólogo correctamente")
        $location.path('/')
      (error) => errorHandler.error("Ocurrió un error interno borrando al odontólogo. Por favor intente nuevamente")
    )

  @viewAttentionTime = =>
    $uibModal.open(
      templateUrl: 'modals/attention_time.html'
      size: 'lg'
      controller: 'AttentionTimeCtrl as AttentionTimeCtrl'
      resolve:
        dentist: => @dentistToEdit
        updateFunction: => @update
    )


  @
)