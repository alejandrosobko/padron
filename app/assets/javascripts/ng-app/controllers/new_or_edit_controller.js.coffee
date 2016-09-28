angular.module('myApp').controller('NewOrEditCtrl', ($stateParams, dentistFactory, visitFactory, $location, growl) ->
  self = @
  @days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']
  @editMode = $stateParams.dentistId
  @dentistToEdit = {}
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
          growl.success('Guardado correctamente')
          $location.path('/')
        (error) -> self.handleError(error)
      )

  @save = ->
    dentistToSave =
      name: @dentistToEdit.name,
      surname: @dentistToEdit.surname,
      enrollment: @dentistToEdit.enrollment,
      location: @dentistToEdit.location,
      institution: @dentistToEdit.institution,
      enrollment: @dentistToEdit.enrollment,
      street: @dentistToEdit.street,
      number: @dentistToEdit.number,
      telephone: @dentistToEdit.telephone,
      cellphone: @dentistToEdit.cellphone,
      email: @dentistToEdit.email,
      specialty: @dentistToEdit.specialty,
      attention_datetime: @dentistToEdit.attention_datetime

    newVisit =
      visit_date: @newVisit.visit_date,
      observations: @newVisit.observations,
      dentist: dentistToSave,
      visitor: @visitor

    visitFactory.save(newVisit,
      (response) ->
        self.newVisit = {}
        growl.success('Se creó el odontólogo correctamente')
        $location.path('/')
      (error) -> self.handleError(error)
    )

  @removeToView = ->
    $location.path('/')
    self.dentistToEdit = {}


  # TODO: Crear directiva

  getDayClass = (data) ->
    date = data.date
    mode = data.mode
    if mode == 'day'
      dayToCheck = new Date(date).setHours(0, 0, 0, 0)
      i = 0
      while i < @events.length
        currentDay = new Date(@events[i].date).setHours(0, 0, 0, 0)
        if dayToCheck == currentDay
          return @events[i].status
        i++
    ''

  @today = ->
    @newVisit.visit_date = new Date

  @today()

  @clear = ->
    @newVisit.visit_date = null

  @inlineOptions =
    customClass: getDayClass
    minDate: new Date
    showWeeks: true

  @dateOptions =
    formatYear: 'yy',
    maxDate: @today()
    minDate: new Date startingDay: 1

  @open = ->
    @popup.opened = true

  @setDate = (year, month, day) ->
    @newVisit.visit_date = new Date(year, month, day)

  @popup = opened: false


  @
)