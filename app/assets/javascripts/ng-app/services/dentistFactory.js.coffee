angular.module('myApp').factory('dentistFactory', ['$http', ($http) ->
  o = {dentists: []}

  o.getAll = (callback, errorHandler) ->
    $http.get('/dentists.json').then(callback, errorHandler)

  o.get = (dentistId, callback, errorHandler) ->
    $http.get("/dentists/#{dentistId}.json").then(callback, errorHandler)

  o.save = (json, callback, errorHandler) ->
    $http.post("/dentists.json", json).then(callback, errorHandler)

  o.delete = (dentistId, callback, errorHandler) ->
    $http.delete("/dentists/#{dentistId}.json").then(callback, errorHandler)

  o.update = (dentist, callback, errorHandler) ->
    $http.put("/dentists/#{dentist.id}.json", dentist).then(callback, errorHandler)

  o.create_visit = (json, callback, errorHandler) ->
    $http.post("/dentists/#{json['dentist']['id']}/create_visit.json", json).then(callback, errorHandler)

  return o
])