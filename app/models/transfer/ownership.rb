# frozen_string_literal: true

class Transfer
  class Ownership
    attr_reader :transfer, :buyer

    def initialize(attrs = {})
      @transfer = Transfer.new(attrs[:transfer])
      @vehicle_id = attrs.dig(:transfer, :vehicle_id)
      @buyer = Person.new(attrs[:buyer])
    end

    def save
      transfer.assign_attributes(buyer: buyer, seller: vehicle.person)

      return false if invalid?

      change_ownership!

      transaction do
        transfer.save!(validate: false)
        buyer.save!(validate: false)
        vehicle.save!(validate: false)
      end

      true
    end

    def valid?
      transfer.valid? && buyer.valid?
    end

    def invalid?
      !valid?
    end

    def vehicle
      @vehicle ||= Vehicle.find @vehicle_id
    end

    private

    def change_ownership!
      vehicle.assign_attributes(person: buyer)
    end

    delegate :transaction, to: ActiveRecord::Base
  end
end
