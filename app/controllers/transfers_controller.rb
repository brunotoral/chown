# frozen_string_literal: true

class TransfersController < ApplicationController
  schema :create, :update do
    required(:transfer).hash do
      required(:doc_image).filled(:string)
      required(:vehicle_id).filled(:string)
      required(:person_id).filled(:string)
    end
  end

  def index
    @transfers = paginate Transfer.all
  end

  def show
    @transfer = Transfer.find params[:id]
  end

  def new
    @ownership = Transfer::Ownership.new
  end

  def create
    @ownership = Transfer::Ownership.new transfer_params

    if @ownership.save
      flash[:sucess] = t(
        '.success',
        vehicle: @ownership.transfer.license_plate,
        name: @ownership.transfer.name
      )

      redirect_to @ownership.transfer
    else
      flash.now[:alert] = t('.alert')

      render :new, status: :unprocessable_entity
    end
  end

  private

  def transfer_params
    safe_params[:transfer].merge(user: current_user)
  end
end
