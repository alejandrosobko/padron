angular.module('padronApp').factory('Dentist', ['railsResourceFactory', 'railsSerializer', 'WorkCalendar',
  (railsResourceFactory, railsSerializer, WorkCalendar) ->

    resource = railsResourceFactory(
      url: '/dentists'
      name: 'dentist'
      serializer: railsSerializer(->
        @nestedAttribute('visits', 'visitor', 'workCalendar', 'workableDays', 'workableHours')
      )
    )

    resource.prototype.getWorkCalendar = ->
      if @workCalendar then WorkCalendar.build(@workCalendar) else new WorkCalendar

    resource.prototype.empty = ->
      (@name == undefined || @name == "") &&
      (@surname == undefined || @surname == "") &&
      (@enrollment == undefined || @enrollment == "") &&
      (@location == undefined || @location == "") &&
      (@institution == undefined || @institution == "") &&
      (@street == undefined || @street == "") &&
      (@number == undefined || @number == "") &&
      (@telephone == undefined || @telephone == "") &&
      (@cellphone == undefined || @cellphone == "") &&
      (@email == undefined || @email == "") &&
      (@specialty == undefined || @specialty == "")


    resource
])