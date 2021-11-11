# frozen_string_literal: true

class Transfer
  class Owner
    attr_reader :transfer, :person, :vehicle

    def initialize(attrs = {})
      @transfer ||= Transfer.new(attrs)
      @person = attrs[:person_id]
      if attrs[:vehicle_id].present?
        @vehicle ||= Vehicle.find(attrs[:vehicle_id])
        @vehicle.assign_attributes(person_id: @person)
      end
    end

    def save
      byebug
      return false if invalid?

      transaction do
        transfer.save!(validate:false)
        vehicle.save!(validate: false)
      end

      true
    end

    def valid?
      vehicle.valid? && transfer.valid?
    end

    def invalid?
      !valid?
    end

    private

    delegate :transaction, to: ActiveRecord::Base
  end
end
