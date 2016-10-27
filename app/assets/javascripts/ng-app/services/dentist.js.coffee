angular.module('padronApp').factory('Dentist', ['railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory(
    url: '/dentists'
    name: 'dentist'
    serializer: railsSerializer( ->
      this.nestedAttribute('visits', 'visitor', 'workCalendar', 'workableDays', 'workableHours')
    )
  )

  resource.prototype.empty = ->
    (@name == undefined || @name == "") &&
    (@surname == undefined || @surname == "") &&
    (@enrollment == undefined || @enrollment == "") &&
    (@location == undefined || @location == "") &&
    (@institution == undefined || @institution == "") &&
    (@street == undefined || @street == "") &&
    (@number == undefined || @number == "") &&
    (@telephone ==undefined || @telephone =="") &&
    (@cellphone == undefined || @cellphone == "") &&
    (@email == undefined || @email == "") &&
    (@specialty == undefined || @specialty == "")


  resource
])