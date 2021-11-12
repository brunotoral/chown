# frozen_string_literal: true

class Transfer
  class Ownership
    attr_reader :transfer, :vehicle

    def initialize(attrs = {})
      @transfer ||= Transfer.new(attrs)
      @person = attrs[:person_id]
      @vehicle ||= Vehicle.find(attrs[:vehicle_id]) if attrs[:vehicle_id].present?
      @vehicle&.assign_attributes(person_id: @person)
    end

    def save
      return false if invalid?

      transaction do
        transfer.save!(validate: false)
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
