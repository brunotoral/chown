# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :set_person, only: %i[new create edit update destroy]
  before_action :set_vehicle, only: %i[show edit update destroy]

  schema :create, :update do
    required(:vehicle).hash do
      required(:license_plate).filled(:string)
      required(:renavam).filled(:string)
      required(:crv_number).filled(:string)
      required(:crv_date).filled(:string)
    end
  end

  def index
    @vehicles = paginate Vehicle.all
  end

  def show; end

  def new
    @vehicle = @person.vehicles.new
  end

  def create
    @vehicle = @person.vehicles.new vehicle_params

    if @vehicle.save
      flash[:success] = t('.success')

      redirect_to @person
    else
      flash.now[:alert] = t('.alert')

      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @vehicle.update vehicle_params
      flash[:success] = t('.success')

      redirect_to @person
    else
      flash.now[:alert] = t('.alert')

      render :edit, :unprocessable_entity
    end
  end

  def destroy
    @vehicle.destroy

    flash[:sucess] = t('.success')

    redirect_to @person
  end

  private

  def set_person
    @person = Person.find params[:person_id]
  end

  def set_vehicle
    @vehicle = Vehicle.find params[:id]
  end

  def vehicle_params
    safe_params[:vehicle]
  end
end
