angular.module('padronApp').factory('WorkCalendar', ['WorkableDay', (WorkableDay) ->
  WorkCalendar = () ->
    @workableDays = []
    @

  WorkCalendar.build = (response) ->
    workCalendar = angular.extend(new WorkCalendar, response)
    workCalendar.workableDays = _.map(response.workableDays, (day) -> new WorkableDay.build(day))
    workCalendar

  WorkCalendar.prototype.getWorkableDayFor = (dayString) ->
    @workableDays.find((workableDay) -> workableDay.day == dayString)

  WorkCalendar.prototype.updateDay = (day, hours) ->
    return unless hours
    dayWanted = @getWorkableDayFor(day)
    if dayWanted
      dayWanted.workableHours.push(hours)
    else
      @workableDays.push({day: day, workableHours: [hours]})

  WorkCalendar.prototype.workableHoursFor = (day) ->
    dayWanted = @getWorkableDayFor(day)
    if dayWanted then dayWanted.workableHours else []


  WorkCalendar
])