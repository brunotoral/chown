# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :vehicles
  has_many :transfers, as: :seller
  has_many :transfers, as: :buyer

  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address

  delegate :state, :city, :street, :district, :zip_code, :number, :complement, to: :address

  validates :name, :document_number, :address, presence: true

  scope :seller, -> { joins(:vehicles).where(vehicles: Vehicle.transferable) }
end
