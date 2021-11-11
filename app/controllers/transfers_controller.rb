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

  def new
    @transfer = Transfer::Owner.new
  end

  def create
    @transfer = Transfer::Owner.new transfer_params.merge(user: current_user)

    if @transfer.save
      flash[:sucess] = t('.success', vehicle: @transfer.transfer.license_plate, name: @transfer.transfer.name)

      redirect_to @transfer.transfer
    else
      flash.now[:alert] = t('.alert')

      render :new, status: :unprocessable_entity
    end
  end

  private

  def transfer_params
    safe_params[:transfer]
  end
end
