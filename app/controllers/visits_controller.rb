class VisitsController < ApplicationController

  def index
    respond_with Visit.all
  end

  def show
    respond_with Visit.find(params[:id])
  end

  def create
    # visit_params[:dentist] = Dentist.create(params[:dentist])
    # visit_params[:visitor] = Visitor.create(params[:visitor])
    respond_with Visit.create(visit_params)
  end

  def destroy
    Visit.find(params[:id]).destroy!
    respond_with Visit.all
  end


  private

  def visit_params
    params[:visit_date] = DateTime.parse(params.fetch(:visit_date, DateTime.now)).utc.iso8601
    params.require(:visit).permit(:visitor, :dentist, :visit_date, :observations)
  end

end
