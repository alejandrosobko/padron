angular.module('padronApp').factory('errorHandler', ['growl', (growl) ->
  o = {}

  o.error = (errorMsg) -> growl.error("<b>Error</b><br>" + errorMsg)

  o.warning = (warningMsg) -> growl.warning("<b>Aviso</b><br>" + warningMsg)

  o.info = (infoMsg) -> growl.info("<b>Perfecto</b><br>" + infoMsg)

  o.success = (successMsg) -> growl.success("<b>Perfecto</b><br>" + successMsg)

  o
])