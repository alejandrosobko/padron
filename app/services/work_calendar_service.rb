class WorkCalendarService

  def initialize(params)
    @params = params
  end

  def create
    workable_hours = [WorkableHour.new(workable_hours_params)]
    workable_days = [WorkableDay.new(workable_days_params.merge(workable_hours: workable_hours))]

    WorkCalendar.new({workable_days: workable_days})
  end


  private

  def workable_hours_params
    work_calendar_params[:workable_days].require(:workable_hours).permit(:from, :to)
  end

  def workable_days_params
    work_calendar_params.require(:workable_days).permit(:day)
  end

  def work_calendar_params
    @params.require(:work_calendar).permit(:workable_days => [:day, :workable_hours => [:from, :to]])
  end

end