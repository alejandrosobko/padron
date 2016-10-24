angular.module('padronApp').factory('Dentist', ['WorkCalendar', (WorkCalendar) ->
  Dentist = (id, name, surname, enrollment, location, institution, street, number, telephone, cellphone, email, specialty, workCalendar) ->
    @id = id || ""
    @name = name || ""
    @surname = surname || ""
    @enrollment = enrollment || ""
    @location = location || ""
    @institution = institution || ""
    @street = street || ""
    @number = number || ""
    @telephone = telephone || ""
    @cellphone = cellphone || ""
    @email = email || ""
    @specialty = specialty || ""
    @workCalendar = workCalendar
    @

  Dentist.prototype.empty = ->
    !@workCalendar && (@name + @surname + @enrollment + @location + @institution + @street + @number + @telephone +
      @cellphone + @email + @specialty).replace(/[^\w\s]/gi, '') == ""

  Dentist.build = (data) ->
    new Dentist(data.id, data.name, data.surname, data.enrollment, data.location, data.institution, data.street,
      data.number, data.telephone, data.cellphone, data.email, data.specialty, WorkCalendar.build(data.work_calendar))

  Dentist
])