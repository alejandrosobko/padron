class InstitutesController < ApplicationController

  def create
    institute = Institute.new(institute_params)
    begin
      institute.save!
      render json: institute
    rescue => e
      render json: institute.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    institute = Institute.find(params[:institute][:id])
    begin
      destroy_hours!
      destroy_days!
      institute.update_attributes!(institute_params)
      render json: institute
    rescue => e
      render json: institute.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def destroy_hours!
    WorkableHour.where(id: params[:institute][:hours_to_remove]).destroy_all
  end

  def destroy_days!
    WorkableDay.where(id: params[:institute][:days_to_remove]).destroy_all
  end

  def institute_params
    params.require(:institute).permit(:id, :name, :street, :number, :location, :dentist_id,
        work_calendar_attributes: [:id,
            workable_days_attributes: [:work_calendar_id, :id, :day,
                workable_hours_attributes: [:id, :from, :to, :workable_day_id]]])

  end

end
