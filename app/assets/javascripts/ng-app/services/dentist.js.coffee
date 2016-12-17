angular.module('padronApp').factory('Dentist', ['railsSerializer', 'RailsResource', 'Institute',
  (railsSerializer, RailsResource, Institute) ->

    class Dentist extends RailsResource
      constructor: ->
        @telephones ||= [""]
        @cellphones ||= [""]
        @emails     ||= [""]
        @institutes ||= [new Institute]

      @configure
        url: '/dentists'
        name: 'dentist'
        serializer: railsSerializer ->
          @nestedAttribute('visits', 'visitor', 'institutes', 'workCalendar', 'workableDays', 'workableHours')
          @resource('institutes', 'Institute')

      @build: (response) ->
        dentist = angular.extend(new Dentist, response)
        dentist.institutes = _.map(response.institutes, (institute) -> new Institute.build(institute))
        dentist

      empty: ->
        @emptyValue(@name) && @emptyValue(@surname) && @emptyValue(@enrollment) && @emptyValue(@telephones) &&
        @emptyValue(@cellphones) && @emptyValue(@emails) && @emptyValue(@specialty)

      emptyValue: (value) ->
        value == undefined || value == null || value == "" || value.length == 0 || (value.length == 1 && value[0] == "")

      hasContact: -> # TODO: combinar el metodo empty con este
        !@emptyValue(@telephones) || !@emptyValue(@cellphones) || !@emptyValue(@emails)

      removeEmptyValues: ->
        @telephones   = _.compact(@telephones) if @telephones.length > 1
        @cellphones   = _.compact(@cellphones) if @cellphones.length > 1
        @emails       = _.compact(@emails)     if @emails.length > 1


    Dentist
])