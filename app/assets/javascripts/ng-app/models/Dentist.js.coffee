angular.module('myApp').factory('Dentist', ->
  Dentist = (id, name, surname, enrollment, location, institution, street, number, telephone, cellphone, email, specialty) ->
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

  Dentist.prototype.empty = ->
    (@name + @surname + @enrollment + @location + @institution + @street + @number + @telephone +
      @cellphone + @email + @specialty).replace(/[^\w\s]/gi, '') == ""

  Dentist.build = (data) ->
    new Dentist(data.id, data.name, data.surname, data.enrollment, data.location, data.institution, data.street,
      data.number, data.telephone, data.cellphone, data.email, data.specialty)

  Dentist
)