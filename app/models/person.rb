# frozen_string_literal: true

class Person < ApplicationRecord
  enum kind: { buyer: 0, seller: 1 }

  has_many :vehicles, dependent: :destroy

  validates :name, :document_number, :kind, presence: true
end
