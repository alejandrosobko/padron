class DentistsController < ApplicationController

  def index
    respond_with Dentist.all
  end

  def show
    respond_with Dentist.find(params[:id])
  end

  def create
    respond_with Dentist.create(dentist_params)
  end

  def update
    dentist = Dentist.find(params[:id])
    dentist.name = params[:dentist][:name]
    dentist.save!

    respond_with dentist
  end

  def destroy
    Dentist.find(params[:id]).destroy!

    respond_with Dentist.all
  end


  private

  def dentist_params
    params.require(:dentist).permit(:name, :surname, :enrollment, :location, :institution, :street, :number, :telephone,
                                    :cellphone, :email, :specialty, :attention_datetime)
  end

end
