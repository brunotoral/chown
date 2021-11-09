class Person < ApplicationRecord
  enum kind: { buyer: 0, seller: 1 }

  validates :name, :document_number, :kind, presence: true
end
