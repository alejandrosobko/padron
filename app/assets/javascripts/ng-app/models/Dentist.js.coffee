angular.module('padronApp').factory('Dentist', ['WorkCalendar', (WorkCalendar) ->
  Dentist = (name, surname, enrollment, location, institution, street, number, telephone, cellphone, email, specialty, work_calendar, id) ->
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
    @work_calendar_attributes = work_calendar || new WorkCalendar()
    @id = id || ""
    @

  Dentist.build = (data) ->
    new Dentist(data.name, data.surname, data.enrollment, data.location, data.institution, data.street, data.number,
      data.telephone, data.cellphone, data.email, data.specialty, WorkCalendar.build(data.work_calendar), data.id)

  Dentist.apiResponseTransformer = (data) ->
    if angular.isArray(data)
      data.map(Dentist.build)
    else
      Dentist.build(data)

  Dentist.prototype.empty = ->
    @work_calendar_attributes.empty() && (@name + @surname + @enrollment + @location + @institution + @street + @number + @telephone +
      @cellphone + @email + @specialty).replace(/[^\w\s]/gi, '') == ""


  Dentist

])