angular.module('padronApp').factory('WorkCalendar', ->
  WorkCalendar = () ->
    @workableDays = []
    @

  WorkCalendar.build = (response) ->
    workCalendar = new WorkCalendar
    angular.copy(response, workCalendar)
    workCalendar.workableDays = response.workableDays || []
    workCalendar

  WorkCalendar.prototype.updateDay = (day, hours) ->
    dayWanted = @workableDays.find((workableDay) -> workableDay.day == day)
    if dayWanted
      @addHours(dayWanted.day, hours)
    else
      @workableDays.push({day: day, workableHours: [hours]})

  WorkCalendar.prototype.addHours = (day, hours) ->
    @workableDays.find((workableDay) -> workableDay.day == day).workableHours.push(hours)

  WorkCalendar.prototype.workableHoursFor = (day) -> # Repeated code with controller
    dayWanted = @workableDays.find((workableDay) -> workableDay.day == day)
    if dayWanted then dayWanted.workableHours else []

  WorkCalendar
)