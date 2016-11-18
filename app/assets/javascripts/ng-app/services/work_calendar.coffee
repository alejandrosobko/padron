angular.module('padronApp').factory('WorkCalendar', ->
  WorkCalendar = () ->
    @workableDays = []
    @

  WorkCalendar.build = (response) ->
    workCalendar = new WorkCalendar
    angular.copy(response, workCalendar)
    workCalendar.workableDays = response.workableDays || []
    workCalendar

  WorkCalendar.prototype.getWorkableDayFor = (dayString) ->
    @workableDays.find((workableDay) -> workableDay.day == dayString)

  WorkCalendar.prototype.updateDay = (day, hours) ->
    return unless hours
    dayWanted = @getWorkableDayFor(day)
    if dayWanted
      @addHours(dayWanted.day, hours)
    else
      @workableDays.push({day: day, workableHours: [hours]})

  WorkCalendar.prototype.addHours = (day, hours) ->
    hours['from'] = parseInt(hours['from'])
    hours['to'] = parseInt(hours['to'])
    @getWorkableDayFor(day).workableHours.push(hours)

  WorkCalendar.prototype.workableHoursFor = (day) ->
    dayWanted = @getWorkableDayFor(day)
    if dayWanted then dayWanted.workableHours else []

  WorkCalendar
)