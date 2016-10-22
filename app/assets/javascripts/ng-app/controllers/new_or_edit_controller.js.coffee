angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, Dentist, Visit, Visitor, dentistFactory, $location, growl) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = {}
  @newVisit = {}
  @newVisitor = {}

  if self.editMode
    dentistFactory.get($stateParams.dentistId,
      (response) -> self.dentistToEdit = response.data
      (error) -> self.handleError(error, "No se pudo obtener al odontólogo")
    )

  @handleError = (error, errorMessage = null) ->
    error = errorMessage || "Algo salió mal cargando los datos"
    growl.error("<b>Error</b><br> #{error}")

  @update = ->
    return unless @editMode
    dentistFactory.update(@dentistToEdit,
      (response) ->
        self.dentistToEdit = undefined
        growl.success('<b>Perfecto</b><br> Se actualizó correctamente')
        $location.path('/')
      (error) -> self.handleError(error)
    )

  @save = ->
    dentist = Dentist.build(@dentistToEdit)
    work_calendar = {workable_days: [{day: 'Lunes', workable_hours: [{from: 9, to: 18}]}]}
    visit = Visit.build(@newVisit)
    visitor = Visitor.build(@newVisitor)

    dentistFactory.save({dentist, work_calendar, visit, visitor},
      (response) ->
        self.dentistToEdit = self.newVisit = self.newVisitor = {}
        growl.success('<b>Perfecto</b><br> Se creó el odontólogo correctamente')
        $location.path('/')
      (error) -> self.handleError(error)
    )

  @new_visit = ->
    visit: Visit.build(@newVisit)
    visitor: Visitor.build(@newVisitor)
    dentist: Dentist.build(@dentistToEdit)

    dentistFactory.create_visit({dentist, visit, visitor},
      (response) ->
        self.dentistToEdit = self.newVisit = self.newVisitor = {}
        growl.success('<b>Perfecto</b><br> Se creó el odontólogo correctamente')
        $location.path('/')
      (error) -> self.handleError(error)
    )

  @removeToView = ->
    $location.path('/')
    self.dentistToEdit = undefined

  @delete = ->
    dentistFactory.delete(@dentistToEdit.id).then(
      (response) ->
        self.dentistToEdit = undefined
        growl.info('<b>Perfecto</b><br> Se borró el odontólogo correctamente')
        $location.path('/')
      (error) -> self.handleError(error)
    )


  @
)