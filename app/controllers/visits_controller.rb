class VisitsController < ApplicationController

  def index
    render json: Visit.all
  end

  def show
    render json: Visit.find(params[:id])
  end

  def create
    visit = Visit.new(visit_params)
    begin
      to_render = visit.save!
    rescue Exception => e
      to_render = "Error creating new visit: #{e.message}"
    end
    render json: to_render
  end

  def destroy
    Visit.find(params[:id]).destroy!
    render json: Visit.all
  end


  private

  def visit_params
    params[:visit_date] = DateTime.parse(params.fetch(:visit_date, DateTime.now)).utc.iso8601
    params.require(:visit).permit(:visitor, :dentist, :visit_date, :observations)
  end

end
