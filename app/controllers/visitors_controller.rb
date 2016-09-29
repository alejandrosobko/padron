class VisitorsController < ApplicationController

  def index
    render json: Visitor.all
  end

  def show
    render json: Visitor.find(params[:id])
  end

  def create
    render json: Visitor.create(visitor_params)
  end

  def destroy
    Visitor.find(params[:id]).destroy!
    render json: Visitor.all
  end


  private

  def visitor_params
    params.require(:visitor).permit(:name)
  end
end
