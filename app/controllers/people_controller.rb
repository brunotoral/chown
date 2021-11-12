# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]

  schema :create, :update do
    required(:person).hash(PersonSchema) do
      required(:address_attributes).hash(AddressSchema)
    end
  end

  def index
    @people = paginate(Person.all)
  end

  def show; end

  def new
    @person = Person.new
    @address = @person.build_address
  end

  def create
    @person = Person.new person_params

    if safe_params.success? && @person.save
      flash[:success] = t('.success', name: @person.name)

      redirect_to @person
    else
      flash.now[:alert] = t('.alert')

      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if safe_params.success? && @person.update(person_params)
      flash[:success] = t('.success')

      redirect_to @person
    else
      flash.now[:alert] = t('.alert')

      render :edit, :unprocessable_entity
    end
  end

  def destroy
    @person.destroy

    flash[:sucess] = t('.success')

    redirect_to people_path
  end

  private

  def set_person
    @person = Person.find params[:id]
  end

  def person_params
    safe_params[:person]
  end
end
