# frozen_string_literal: true

class TransfersController < ApplicationController
  schema :create do
    required(:transfer).hash do
      required(:doc_image)
      required(:vehicle_id).filled(:string)

      required(:person).hash(PersonSchema) do
        required(:address_attributes).hash(AddressSchema)
      end
    end
  end

  def index
    transfer = Transfer.filtered(filters: [filter])
    @transfers = paginate transfer
  end

  def show
    @transfer = Transfer.find params[:id]
  end

  def new
    @ownership = Transfer::Ownership.new

    authorize @ownership
  end

  def create
    @ownership = Transfer::Ownership.new ownership_params

    authorize @ownership

    if safe_params.success? && @ownership.save
      flash[:sucess] = t('.success', vehicle: @ownership.transfer.license_plate, name: @ownership.transfer.name)

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

  def filter
    params[:filter]
  end
end
