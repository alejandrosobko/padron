angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, dentistFactory, $location, growl) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = {}
  @visitor = {'name': ''}
  @newVisit = {}

  @handleError = (error, errorMessage = null) ->
    error = errorMessage || "Algo salió mal cargando los datos"
    growl.error("<b>Error</b><br> #{error}")

  if self.editMode
    dentistFactory.get($stateParams.dentistId,
      (response) -> self.dentistToEdit = response.data
      (error) -> self.handleError(error, "No se pudo obtener al odontólogo")
    )

  @update = ->
    if @editMode
      dentistFactory.update(@dentistToEdit,
        (response) ->
          self.dentistToEdit = {}
          growl.success('<b>Perfecto</b><br> Se actualizó correctamente')
          $location.path('/')
        (error) -> self.handleError(error)
      )

  @save = ->
    visit = {visit_date: @newVisit.visit_date, observations: @newVisit.observations}
    visitor = @visitor
    dentist =
      name: @dentistToEdit.name
      surname: @dentistToEdit.surname
      enrollment: @dentistToEdit.enrollment
      location: @dentistToEdit.location
      institution: @dentistToEdit.institution
      enrollment: @dentistToEdit.enrollment
      street: @dentistToEdit.street
      number: @dentistToEdit.number
      telephone: @dentistToEdit.telephone
      cellphone: @dentistToEdit.cellphone
      email: @dentistToEdit.email
      specialty: @dentistToEdit.specialty

    dentistFactory.add({visit, visitor, dentist},
      (response) ->
        self.newVisit = {}
        self.dentistToEdit = {}
        growl.success('<b>Perfecto</b><br> Se creó el odontólogo correctamente')
        $location.path('/')
      (error) -> self.handleError(error)
    )

  @new_visit = ->
    visit: {visit_date: @newVisit.visit_date, observations: @newVisit.observations}
    visitor: @visitor
    dentist:
      id: @dentistToEdit.id
      name: @dentistToEdit.name
      surname: @dentistToEdit.surname
      enrollment: @dentistToEdit.enrollment
      location: @dentistToEdit.location
      institution: @dentistToEdit.institution
      enrollment: @dentistToEdit.enrollment
      street: @dentistToEdit.street
      number: @dentistToEdit.number
      telephone: @dentistToEdit.telephone
      cellphone: @dentistToEdit.cellphone
      email: @dentistToEdit.email
      specialty: @dentistToEdit.specialty

    dentistFactory.create_visit({visit, visitor, dentist},
      (response) ->
        self.newVisit = {}
        self.dentistToEdit = {}
        growl.success('<b>Perfecto</b><br> Se creó el odontólogo correctamente')
        $location.path('/')
      (error) -> self.handleError(error)
    )



  @removeToView = ->
    $location.path('/')
    self.dentistToEdit = {}

  @delete = ->
    dentistFactory.delete(@dentistToEdit.id).then(
      (response) ->
        self.dentistToEdit = {}
        growl.info('<b>Perfecto</b><br> Se borró el odontólogo correctamente')
        $location.path('/')
      (error) -> self.handleError(error)
    )


  @
)