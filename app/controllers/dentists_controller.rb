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
      destroy_hours(params[:dentist][:hours_to_remove])
      destroy_days(params[:dentist][:days_to_remove])
      destroy_institutes(params[:dentist][:institutes_to_remove]) # TODO: Refactor
      dentist.update!(dentist_params)
      render json: dentist
    rescue => e
      render json: dentist.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    Dentist.find(params[:id]).destroy!
    render json: Dentist.all
  end


  private

  def destroy_hours(hours)
    WorkableHour.where(id: hours).destroy_all
  end

  def destroy_days(days)
    WorkableDay.where(id: days).destroy_all
  end

  def destroy_institutes(institutes)
    Institute.where(id: institutes).destroy_all
  end

  def dentist_params
    params.require(:dentist).permit(
        :name, :surname, :enrollment, :specialty, :attention_datetime, telephones: [], cellphones: [], emails: [],
        visits_attributes: [:id, :visit_date, :observations, visitor_attributes: [:id, :name]],
        work_calendar_attributes: [:id,
                                   workable_days_attributes: [:work_calendar_id, :id, :day,
                                                              workable_hours_attributes: [:id, :from, :to, :workable_day_id]]],
        institutes_attributes: [:id, :name, :location, :street, :number])
  end

end
