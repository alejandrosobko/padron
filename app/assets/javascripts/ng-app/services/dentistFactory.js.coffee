angular.module('myApp').factory('dentistFactory', ['$http', ($http) ->
  o = {dentists: []}

  o.getAll = (callback, errorHandler) -> $http.get('/dentists.json').then(callback, errorHandler)
  o.get = (dentistId, callback, errorHandler) -> $http.get("/dentists/#{dentistId}.json").then(callback, errorHandler)
  o.add = (dentist, callback, errorHandler) -> $http.post("/dentists.json#{dentist}").then(callback, errorHandler)

  o.delete = (dentist, callback, errorHandler) ->
    index = o.dentists.indexOf(dentist)
    if (index > -1)
      $http.delete("/dentists/#{dentist.id}.json").then(callback, errorHandler)

  o.update = (dentist, callback, errorHandler) ->
    toSave = # TODO: Mover lógica a clase de dominio en Angular
      id: dentist.id, name: dentist.name, surname: dentist.surname, enrollment: dentist.enrollment,
      location: dentist.location, institution: dentist.institution, enrollment: dentist.enrollment,
      street: dentist.street, number: dentist.number, telephone: dentist.telephone, cellphone: dentist.cellphone,
      email: dentist.email, specialty: dentist.specialty, attention_datetime: dentist.attention_datetime
    $http.put("/dentists/#{dentist.id}.json", toSave).then(callback, errorHandler)

  return o
])