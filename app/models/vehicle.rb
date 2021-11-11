class Vehicle < ApplicationRecord
  belongs_to :person

  delegate :document_number, to: :person

  validates :license_plate, :renavam, :crv_number, :crv_date, presence: true
end
