class DentistsController < ApplicationController

  def index
    render json: Dentist.all
  end

  def show
    render json: Dentist.find(params[:id])
  end

  def create
    render json: Dentist.create(dentist_params)
  end

  def update
    dentist = Dentist.find(params[:id])
    dentist.update!(dentist_params)

    render json: dentist
  end

  def destroy
    Dentist.find(params[:id]).destroy!
    render json: Dentist.all
  end


  private

  def dentist_params
    params.require(:dentist).permit(:name, :surname, :enrollment, :location, :institution, :street, :number, :telephone,
                                    :cellphone, :email, :specialty, :attention_datetime)
  end

end
