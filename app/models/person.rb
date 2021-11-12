# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :vehicles
  has_many :transfers, as: :seller
  has_many :transfers, as: :buyer

  validates :name, :document_number, presence: true

  scope :seller, -> { joins(:vehicles).where(vehicles: Vehicle.transferable) }
end
