angular.module('padronApp').factory('Dentist', ['railsResourceFactory', 'railsSerializer', 'WorkCalendar',
  (railsResourceFactory, railsSerializer, WorkCalendar) ->

    resource = railsResourceFactory(
      url: '/dentists'
      name: 'dentist'
      serializer: railsSerializer(->
        @nestedAttribute('visits', 'visitor', 'workCalendar', 'workableDays', 'workableHours')
      )
    )

    resource.prototype.completeData = ->
      @locations ||= [""]
      @institutions ||= [""]
      @streets ||= [""]
      @numbers ||= [""]
      @telephones ||= [""]
      @cellphones ||= [""]
      @emails ||= [""]
      @

    resource.prototype.getWorkCalendar = ->
      if @workCalendar then WorkCalendar.build(@workCalendar) else new WorkCalendar

    resource.prototype.empty = ->
      @emptyValue(@name) && @emptyValue(@surname) && @emptyValue(@enrollment) && @emptyValue(@locations) &&
      @emptyValue(@institutions) && @emptyValue(@streets) && @emptyValue(@numbers) && @emptyValue(@telephones) &&
      @emptyValue(@cellphones) && @emptyValue(@emails) && @emptyValue(@specialtys)

    resource.prototype.emptyValue = (value) ->
      value == undefined || value == null || value == "" || value.length == 0 || (value.length == 1 && value[0] == "")

    resource.prototype.removeEmptyValues = -> # TODO: No puedo ponerlos en una lista y recorrer la lista aplicando compact
      @locations    = _.compact(@locations)    if @locations.length > 1
      @institutions = _.compact(@institutions) if @institutions.length > 1
      @streets      = _.compact(@streets)      if @streets.length > 1
      @numbers      = _.compact(@numbers)      if @numbers.length > 1
      @telephones   = _.compact(@telephones)   if @telephones.length > 1
      @cellphones   = _.compact(@cellphones)   if @cellphones.length > 1
      @emails       = _.compact(@emails)       if @emails.length > 1

    resource
])