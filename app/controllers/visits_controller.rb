class VisitsController < ApplicationController

  def index
    render json: Visit.all
  end

  def show
    render json: Visit.find(params[:id])
  end

  def create
    params[:dentist] = Dentist.create(dentist_params)
    params[:visitor] = Visitor.create(visitor_params)
    begin
      to_render = Visit.create(visit_params)
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

  def dentist_params
    params.require(:dentist).permit(:name, :surname, :enrollment, :location, :institution, :street, :number, :telephone,
                                    :cellphone, :email, :specialty, :attention_datetime)
  end

  def visitor_params
    params.require(:visitor).permit(:name)
  end

end
