# frozen_string_literal: true

class Vehicle < ApplicationRecord
  include Filterable

  belongs_to :person

  delegate :document_number, :document_kind, to: :person

  has_one :transfer

  validates :license_plate, :renavam, :crv_number, :crv_date, presence: true

  scope :filter_by_transferable, -> { where.missing(:transfer) }
  scope :filter_by_transfered, -> { joins(:transfer) }
  scope :filter_by_owner_name, -> { joins(:person).order(name: :asc) }
end
