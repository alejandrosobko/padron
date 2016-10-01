class VisitsController < ApplicationController

  def index
    render json: Visit.all
  end

  def show
    render json: Visit.find(params[:id])
  end

  def create
    visit = VisitService.new(params).create
    begin
      to_render = visit.save!
    rescue => e
      to_render = "Error creating new visit: #{e.message}"
    end
    render json: to_render
  end

  def destroy
    Visit.find(params[:id]).destroy!
    render json: Visit.all
  end

end
