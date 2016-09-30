class VisitsController < ApplicationController

  def index
    render json: Visit.all
  end

  def show
    render json: Visit.find(params[:id])
  end

  def create
    dentist = Dentist.find_or_initialize_by dentist_params
    visitor = Visitor.find_or_initialize_by visitor_params
    visit = Visit.new({dentist: dentist, visitor: visitor, visit_date: visit_date_parsed,
                                                           observations: params[:visit][:observations]})
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


  private

  def dentist_params
    params.require(:dentist).permit(:name, :surname, :enrollment, :location, :institution, :street, :number, :telephone,
                                    :cellphone, :email, :specialty, :attention_datetime)
  end

  def visitor_params
    params.require(:visitor).permit(:name)
  end

  def visit_date_parsed
    DateTime.parse(params.fetch(:visit_date, DateTime.now)).utc.iso8601
  end

end
