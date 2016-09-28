angular.module('myApp').factory('visitFactory', ['$http', ($http) ->
  o = {visits: []}

  o.save = (visit, callback, errorHandler) ->
    $http.post("/visits.json", visit).then(callback, errorHandler)

  return o
])