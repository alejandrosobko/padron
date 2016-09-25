angular.module('myApp').factory('dentistFactory', ['$http', ($http) ->
  o = {dentists: []}

  o.getAll = ->
    $http.get('/dentists.json').then(
      (response) -> angular.copy(response.data, o.dentists),
      (error) -> console.log("Error getting all dentists: " + error)
    )
    return o.dentists

  o.get = (dentistId) ->
    $http.get("/dentists/#{dentistId}.json").then(
      (response) -> angular.copy(response.data, o.dentists),
      (error) -> console.log("Error getting the dentist by id: " + error)
    )

  o.addDentist = (dentist) ->
    $http.post('/dentists.json', dentist).then(
      (response) -> o.dentists.push(response.data),
      (error) -> console.log("Error adding a dentist: " + error)
    )

  o.delete = (dentist) ->
    index = o.dentists.indexOf(dentist)
    if (index > -1)
      $http.delete('/dentists/' + dentist.id + '.json').then(
        (response) -> o.dentists.splice(index, 1),
        (error) -> console.log("Error deleting a dentist: " + error)
      )

  o.saveDentist = (dentist) ->
    $http.put('/dentists/' + dentist.id, dentist).then(
      (response) -> dentist = response.data,
      (error) -> console.log("Error saving a dentist: " + error)
    )

  return o
])