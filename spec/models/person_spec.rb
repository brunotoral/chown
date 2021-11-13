# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :vehicles }
    it { is_expected.to have_many :transfers }
    it { is_expected.to have_one :address }
  end

  describe '.filter_by_name' do
    it 'returns person in alphabeticall order' do
      albion = Fabricate(:person, name: 'Albion')
      bastion = Fabricate(:person, name: 'Bastion')
      zeta = Fabricate(:person, name: 'Zeta')

      people = described_class.filter_by_name

      expect(people).to match_array([albion, bastion, zeta])
    end
  end

  describe '.filter_by_transferable' do
    it 'returns only person with transferable vehicles' do
      albion = Fabricate(:person, name: 'Albion')
      bastion = Fabricate(:person, name: 'Bastion')
      zeta = Fabricate(:person, name: 'Zeta')
      fusca = Fabricate(:vehicle, person: albion)
      chevete = Fabricate(:vehicle, person: bastion)
      uno = Fabricate(:vehicle, person: zeta)
      transfer = Fabricate(:transfer, vehicle: uno)

      people = described_class.filter_by_transferable

      expect(people).to match_array([albion, bastion])
    end
  end


  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :document_number }
    it { is_expected.to validate_presence_of :address }
  end
end
