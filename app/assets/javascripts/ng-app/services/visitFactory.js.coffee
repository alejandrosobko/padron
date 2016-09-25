angular.module('myApp').factory('visitFactory', ['$http', ($http) ->
  o = {visits: []}

  o.getByDentistId = (dentistId) -> # TODO: Hacer
    $http.get("/visits/dentist/#{dentistId}.json").then(
      (response) -> angular.copy(response.data, o.visits),
      (error) -> console.log("Error getting visit by dentist id: " + error)
    )
    return o.visits

  return o
])