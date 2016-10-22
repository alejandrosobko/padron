angular.module('myApp').factory('errorHandler', ['growl', (growl) ->
  o = {}

  o.error = (errorMsg) -> growl.error("<b>Error</b><br>" + errorMsg)

  o.info = (infoMsg) -> growl.error("<b>Perfecto</b><br>" + infoMsg)

  o.success = (successMsg) -> growl.success("<b>Perfecto</b><br>" + successMsg)

  o
])