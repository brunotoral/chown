# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :person }
    it { is_expected.to have_one :transfer }
  end

  describe '.transferable' do
    it 'returns only transferable vehicles' do
      fusca = Fabricate(:vehicle)
      chevete = Fabricate(:vehicle)
      uno = Fabricate(:vehicle)
      transfer = Fabricate(:transfer, vehicle: uno)

      vehicles = described_class.transferable

      expect(vehicles).to match_array([fusca, chevete])
    end
  end


  describe 'validations' do
    it { is_expected.to validate_presence_of :license_plate }
    it { is_expected.to validate_presence_of :renavam }
    it { is_expected.to validate_presence_of :crv_number }
    it { is_expected.to validate_presence_of :crv_date }
  end
end
