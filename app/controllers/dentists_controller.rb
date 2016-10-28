class DentistsController < ApplicationController

  def index
    render json: Dentist.all
  end

  def show
    render json: Dentist.find(params[:id])
  end

  def create
    dentist = Dentist.new(dentist_params)
    dentist.work_calendar ||= WorkCalendar.new
    begin
      dentist.save!
      render json: dentist
    rescue => e
      render json: dentist.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    dentist = Dentist.find(params[:dentist][:id])
    begin
      dentist.update!(dentist_params)
      render json: dentist
    rescue => e
      render json: dentist.errors.messages, status: :unprocessable_entity
    end
  end

  def create_visit # TODO: Borrar
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
                                    :cellphone, :email, :specialty, :attention_datetime,
                                    visits_attributes: [:id, :visit_date, :observations, visitor_attributes: [:id, :name]],
                                    work_calendar_attributes: [:id, workable_days_attributes: [:id, :day, workable_hours_attributes: [:id, :from, :to]]])
  end


end
