class VisitorsController < ApplicationController

  def index
    render json: Visitor.all
  end

  def show
    render json: Visitor.find(params[:id])
  end

  def create
    visitor = VisitorService.new(params).find_or_new
    begin
      to_render = visitor.save!
    rescue => e
      to_render = "Error creating new visitor: #{e.message}"
    end
    render json: to_render
  end

  def destroy
    Visitor.find(params[:id]).destroy!
    render json: Visitor.all
  end

end
