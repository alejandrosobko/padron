angular.module('padronApp').factory('Institute', ['railsSerializer', 'RailsResource', 'WorkCalendar',
  (railsSerializer, RailsResource, WorkCalendar) ->

    class Institute extends RailsResource
      constructor: ->
        @name ||= ''
        @street ||= ''
        @number ||= ''
        @location ||= ''
        @workCalendar = new WorkCalendar

      @configure
        url: '/institutes'
        name: 'institute'
        serializer: railsSerializer ->
          @nestedAttribute('workCalendar', 'workableDays', 'workableHours')

      @build = (response) ->
        institute = angular.extend(new Institute, response)
        institute.workCalendar = new WorkCalendar.build(response.workCalendar)
        institute

    Institute
])