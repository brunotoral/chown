class Address < ApplicationRecord
  belongs_to :person

  validates :state, :city, :street, :district, :zip_code, presence: true
end
