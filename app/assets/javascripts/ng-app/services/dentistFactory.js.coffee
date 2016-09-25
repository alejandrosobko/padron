angular.module('myApp').factory('dentistFactory', ['$http', ($http) ->
  o = {dentists: []}

  o.getAll = ->
    $http.get('/dentists.json').then(
      (response) -> angular.copy(response.data, o.dentists),
      (error) -> console.log("Error getting all dentists: #{error}")
    )
    return o.dentists

  o.get = (dentistId) ->
    $http.get("/dentists/#{dentistId}.json").then(
      (response) -> angular.copy(response.data, o.dentists),
      (error) -> console.log("Error getting the dentist by id: #{error}")
    )
    return o.dentists

  o.add = (dentist) ->
    $http.post("/dentists.json#{dentist}").then(
      (response) -> o.dentists.push(response.data),
      (error) -> console.log("Error adding a dentist: #{error}")
    )
    return o.dentists

  o.delete = (dentist) ->
    index = o.dentists.indexOf(dentist)
    if (index > -1)
      $http.delete("/dentists/#{dentist.id}.json").then(
        (response) -> o.dentists.splice(index, 1),
        (error) -> console.log("Error deleting a dentist: #{error}")
      )
    return o.dentists

  o.save = (dentist) ->
    toSave =
      id: dentist.id, name: dentist.name, surname: dentist.surname, enrollment: dentist.enrollment,
      location: dentist.location, institution: dentist.institution, enrollment: dentist.enrollment,
      street: dentist.street, number: dentist.number, telephone: dentist.telephone, cellphone: dentist.cellphone,
      email: dentist.email, specialty: dentist.specialty, attention_datetime: dentist.attention_datetime

    $http.put("/dentists/#{dentist.id}.json", toSave).then(
      (response) -> response,
      (error) -> console.log("Error saving a dentist: #{error}")
    )
    return o.dentists

  return o
])