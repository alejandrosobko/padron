class DentistsController < ApplicationController

  def index
    render json: Dentist.all
  end

  def show
    render json: Dentist.find(params[:id])
  end

  def create
    dentist = DentistService.new(params).create
    begin
      dentist.save!
      to_render = dentist
    rescue => e
      to_render = e.message
    end
    render json: to_render
  end

  def update
    dentist = Dentist.find(params[:dentist][:id])
    if dentist.update(dentist_params)
      render json: dentist
    else
      render json: dentist.errors.messages, status: :unprocessable_entity
    end
  end

  def create_visit
    dentist = Dentist.find(params[:id])
    visit = VisitService.new(params).find_or_new
    visit.save!
    dentist.visits.push(visit)
    begin
      dentist.save!
      to_render = visit
    rescue => e
      to_render = e.message
    end
    render json: to_render
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
