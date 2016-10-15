class DentistService

  def initialize(params)
    @params = params
  end

  def create
    work_calendar = WorkCalendarService.new(@params).create
    dentist = Dentist.new(dentist_params.merge(work_calendar: work_calendar))
    dentist.visits = [VisitService.new(@params).find_or_new]
    dentist
  end

  def update
    dentist = Dentist.find(@params[:dentist][:id])
    dentist.update!(dentist_params)
    dentist
  end


  private

  def dentist_params
    @params.require(:dentist).permit(:name, :surname, :enrollment, :location, :institution, :street, :number, :telephone,
                                     :cellphone, :email, :specialty, :attention_datetime)
  end

end