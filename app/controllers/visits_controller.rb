class VisitsController < ApplicationController

  def index
    respond_with Visit.all
  end

  def show
    respond_with Visit.find(params[:id])
  end

  def create
    respond_with Visit.create(visit_params)
  end

  def destroy
    Visit.find(params[:id]).destroy!
    respond_with Visit.all
  end


  private

  def visit_params
    params.require(:visit).permit(:visitor, :dentist, :visit_date)
  end

end
