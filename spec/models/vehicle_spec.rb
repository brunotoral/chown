# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :person }
    it { is_expected.to have_one :transfer }
  end

  describe '.filter_by_transferable' do
    it 'returns only transferable vehicles' do
      fusca = Fabricate(:vehicle)
      chevete = Fabricate(:vehicle)
      uno = Fabricate(:vehicle)
      transfer = Fabricate(:transfer, vehicle: uno)

      vehicles = described_class.filter_by_transferable

      expect(vehicles).to match_array([fusca, chevete])
    end
  end

  describe '.filter_by_transfered' do
    it 'returns only transfered vehicles' do
      fusca = Fabricate(:vehicle)
      chevete = Fabricate(:vehicle)
      uno = Fabricate(:vehicle)
      transfer = Fabricate(:transfer, vehicle: uno)

      vehicles = described_class.filter_by_transfered

      expect(vehicles).to match_array([uno])
    end
  end


  describe '.filter_by_owner_name' do
    it 'returns vehicles ordered by owner name' do
      albion = Fabricate(:person, name: 'Albion')
      bastion = Fabricate(:person, name: 'Bastion')
      zeta = Fabricate(:person, name: 'Zeta')
      fusca = Fabricate(:vehicle, person: albion)
      chevete = Fabricate(:vehicle, person: bastion)
      uno = Fabricate(:vehicle, person: zeta)

      vehicles = described_class.filter_by_owner_name

      expect(vehicles).to match_array([fusca, chevete, uno])
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :license_plate }
    it { is_expected.to validate_presence_of :renavam }
    it { is_expected.to validate_presence_of :crv_number }
    it { is_expected.to validate_presence_of :crv_date }
  end
end
