angular.module('myApp').factory('visitFactory', ['$http', ($http) ->
  o = {visits: []}

  o.getByDentistId = -> # TODO: Hacer
    $http.get('/visits.json').then(
      (response) -> angular.copy(response.data, o.visits),
      (error) -> console.log("Error getting all visits: " + error)
    )
    return o.visits

  return o
])