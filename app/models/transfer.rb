# frozen_string_literal: true

class Transfer < ApplicationRecord
  belongs_to :vehicle
  belongs_to :buyer, class_name: 'Person'
  belongs_to :seller, class_name: 'Person'
  belongs_to :user

  delegate :email, to: :user
  delegate :name, :document_number, to: :buyer
  delegate :license_plate, :renavem, to: :vehicle

  has_one_attached :doc_image

  validates :doc_image, presence: true
  validates_uniqueness_of :vehicle
end
