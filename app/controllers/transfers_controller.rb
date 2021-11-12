# frozen_string_literal: true

class TransfersController < ApplicationController
  schema :create do
    required(:transfer).hash do
      required(:doc_image).filled(:string)
      required(:vehicle_id).filled(:string)

      required(:person).hash do
        required(:name).filled(:string)
        required(:document_number).filled(:string)
      end
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
    @ownership = Transfer::Ownership.new ownership_params

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

  def ownership_params
    { transfer: transfer_params, buyer: buyer_params }
  end

  def transfer_params
    safe_params[:transfer].except(:person).merge(user: current_user)
  end

  def buyer_params
    safe_params[:transfer][:person]
  end
end
