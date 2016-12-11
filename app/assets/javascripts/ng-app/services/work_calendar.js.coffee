angular.module('padronApp').factory('WorkCalendar', ['WorkableDay', (WorkableDay) ->

  class WorkCalendar
    constructor: ->
      @workableDays = []

    @build: (response) ->
      workCalendar = angular.extend(new WorkCalendar, response)
      workCalendar.workableDays = _.map(response.workableDays, (day) -> angular.extend(new WorkableDay, day))
      workCalendar

    getWorkableDayFor: (dayString) ->
      @workableDays.find((workableDay) -> workableDay.day == dayString)

    updateDay: (day, hours) ->
      return unless hours
      dayWanted = @getWorkableDayFor(day)
      if dayWanted
        dayWanted.workableHours.push(hours)
      else
        @workableDays.push({day: day, workableHours: [hours]})

    workableHoursFor: (day) ->
      dayWanted = @getWorkableDayFor(day)
      if dayWanted then dayWanted.workableHours else []


  WorkCalendar
])