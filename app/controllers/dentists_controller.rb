class DentistsController < ApplicationController

  def index
    render json: Dentist.all
  end

  def show
    render json: Dentist.find(params[:id])
  end

  def create
    dentist = DentistService.new(params).create
    begin
      to_render = dentist.save!
    rescue => e
      to_render = "Error creating new dentist: #{e.message}"
    end
    render json: to_render
  end

  def update
    dentist = DentistService.new(params).update
    render json: dentist
  end

  def destroy
    Dentist.find(params[:id]).destroy!
    render json: Dentist.all
  end

end
