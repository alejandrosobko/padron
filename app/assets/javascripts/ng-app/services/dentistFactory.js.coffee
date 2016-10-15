angular.module('myApp').factory('dentistFactory', ['$http', ($http) ->
  o = {dentists: []}

  o.getAll = (callback, errorHandler) ->
    $http.get('/dentists.json').then(callback, errorHandler)

  o.get = (dentistId, callback, errorHandler) ->
    $http.get("/dentists/#{dentistId}.json").then(callback, errorHandler)

  o.add = (json, callback, errorHandler) ->
    $http.post("/dentists.json", json).then(callback, errorHandler)

  o.delete = (dentistId, callback, errorHandler) ->
    $http.delete("/dentists/#{dentistId}.json").then(callback, errorHandler)

  o.update = (dentist, callback, errorHandler) ->
    toSave = # TODO: Mover lógica a clase de dominio en Angular
      id: dentist.id, name: dentist.name, surname: dentist.surname, enrollment: dentist.enrollment,
      location: dentist.location, institution: dentist.institution, enrollment: dentist.enrollment,
      street: dentist.street, number: dentist.number, telephone: dentist.telephone, cellphone: dentist.cellphone,
      email: dentist.email, specialty: dentist.specialty
    $http.put("/dentists/#{dentist.id}.json", toSave).then(callback, errorHandler)

  o.create_visit = (json, callback, errorHandler) ->
    $http.post("/dentists/#{json['dentist']['id']}/create_visit.json", json).then(callback, errorHandler)

  return o
])