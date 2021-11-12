# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :vehicles
  has_many :transfers

  validates :name, :document_number, presence: true
end
