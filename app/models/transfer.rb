class Transfer < ApplicationRecord
  belongs_to :vehicle
  belongs_to :person
  belongs_to :user
end
