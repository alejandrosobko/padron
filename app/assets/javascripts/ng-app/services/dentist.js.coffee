angular.module('padronApp').factory('Dentist', ['railsResourceFactory', 'railsSerializer', 'WorkCalendar',
  (railsResourceFactory, railsSerializer, WorkCalendar) ->

    resource = railsResourceFactory(
      url: '/dentists'
      name: 'dentist'
      serializer: railsSerializer(->
        @nestedAttribute('visits', 'visitor', 'institutes', 'workCalendar', 'workableDays', 'workableHours')
      )
    )

    #-----------------------
    # Model methods
    #-----------------------

    resource.prototype.completeData = ->
      @institutes ||= [{name: '', street: '', number: '', location: ''}]
      @telephones ||= [""]
      @cellphones ||= [""]
      @emails     ||= [""]
      @

    resource.prototype.getWorkCalendar = ->
      if @workCalendar then WorkCalendar.build(@workCalendar) else new WorkCalendar

    resource.prototype.empty = ->
      @emptyValue(@name) && @emptyValue(@surname) && @emptyValue(@enrollment) && @emptyValue(@telephones) &&
      @emptyValue(@cellphones) && @emptyValue(@emails) && @emptyValue(@specialty)

    resource.prototype.emptyValue = (value) ->
      value == undefined || value == null || value == "" || value.length == 0 || (value.length == 1 && value[0] == "")

    resource.prototype.removeEmptyValues = ->
      @telephones   = _.compact(@telephones) if @telephones.length > 1
      @cellphones   = _.compact(@cellphones) if @cellphones.length > 1
      @emails       = _.compact(@emails)     if @emails.length > 1

    resource.prototype.newInstitute = ->
      @institutes.push({name: '', location: '', street: '', number: ''})


    resource
])