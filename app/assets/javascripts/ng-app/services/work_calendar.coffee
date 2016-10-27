angular.module('padronApp').factory('WorkCalendar', ->
  WorkCalendar = () ->

  WorkCalendar.build = (response) ->
    workCalendar = new WorkCalendar
    workCalendar.workableDays = response.workableDays || []
    workCalendar

  WorkCalendar.prototype.updateDay = (day, hours) ->
    dayWanted = @workableDays.find((workableDay) -> workableDay.day == day)
    if dayWanted
      @addHours(dayWanted, hours)
    else
      @workableDays.push({day: day, workableHours: [hours]})

  WorkCalendar.prototype.addHours = (day, hours) ->
    @workableDays[day].workableHours.push(hours)

  WorkCalendar
)