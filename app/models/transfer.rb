# frozen_string_literal: true

class Transfer < ApplicationRecord
  include Filterable

  belongs_to :vehicle
  belongs_to :buyer, class_name: 'Person'
  belongs_to :seller, class_name: 'Person'
  belongs_to :user

  delegate :email, to: :user
  delegate :name, :document_number, to: :buyer
  delegate :license_plate, :renavam, to: :vehicle

  has_one_attached :doc_image

  validates :doc_image, presence: true
  validates_uniqueness_of :vehicle

  scope :filter_by_creation, -> { order(created_at: :desc) }
  scope :filter_by_user, -> { joins(:user).order(email: :asc) }
end
