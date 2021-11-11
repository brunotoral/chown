class Vehicle < ApplicationRecord
  belongs_to :person

  delegate :document_number, to: :person

  has_one :transfer

  validates :license_plate, :renavam, :crv_number, :crv_date, presence: true

  scope :transferable, -> { where.missing(:transfer)}
end
