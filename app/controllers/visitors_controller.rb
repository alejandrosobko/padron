class VisitorsController < ApplicationController

  def index
    respond_with Visitor.all
  end

  def show
    respond_with Visitor.find(params[:id])
  end

  def create
    respond_with Visitor.create(visitor_params)
  end

  def destroy
    Visitor.find(params[:id]).destroy!
    respond_with Visitor.all
  end


  private

  def visitor_params
    params.require(:visitor).permit(:name)
  end
end
