class DentistService

  def initialize(params)
    @params = params
  end

  def create
    if @params[:dentist][:id]
      Dentist.find(@params[:dentist][:id])
    else
      Dentist.new(dentist_params)
    end
  end

  def update
    dentist = Dentist.find(@params[:id])
    dentist.update!(dentist_params)
  end


  private

  def dentist_params
    @params.require(:dentist).permit(:name, :surname, :enrollment, :location, :institution, :street, :number, :telephone,
                                    :cellphone, :email, :specialty, :attention_datetime)
  end

end