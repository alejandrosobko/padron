class WorkCalendarService

  def initialize(params)
    @params = params
  end

  def create
    workable_days = @params.require(:work_calendar).permit('workable_days').map do |days_hash|
      workable_hours = days_hash['workable_hours'].map do |hours|
        WorkableHour.new(workable_hours_params(hours))
      end
      WorkableDay.new(workable_days_params(days_hash).merge(workable_hours: workable_hours))
    end

    WorkCalendar.new({workable_days: workable_days})
  end


  private

  def workable_hours_params(hours_params)
    hours_params.require(:workable_hours).permit(:from, :to)
  end

  def workable_days_params(days_params)
    days_params.permit(:day)
  end

end