# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transfer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :vehicle }
    it { is_expected.to belong_to :buyer }
    it { is_expected.to belong_to :seller }
    it { is_expected.to belong_to :user }
  end

  describe '.filter_by_user' do
    it 'returns transfer in alphabeticall order of the user' do
      albion = Fabricate(:user, email: 'albion@example.com')
      bastion = Fabricate(:user, email: 'bastion@example.com')
      transfer_one = Fabricate(:transfer, user: albion)
      transfer_two = Fabricate(:transfer, user: bastion)

      people = described_class.filter_by_user

      expect(people).to match_array([transfer_one, transfer_two])
    end
  end

  describe '.filter_by_cpf' do
    it 'returns only transfers with buyers with cpf' do
      frodo = Fabricate(:person)
      sam = Fabricate(:person, document_kind: :cnpj)
      albion = Fabricate(:user, email: 'albion@example.com')
      bastion = Fabricate(:user, email: 'bastion@example.com')
      transfer_one = Fabricate(:transfer, user: albion, buyer: sam)
      transfer_two = Fabricate(:transfer, user: bastion, buyer: frodo)

      people = described_class.filter_by_cpf

      expect(people).to match_array([transfer_two])
    end
  end

  describe '.filter_by_cnpj' do
    it 'returns only transfers with buyers with cnpj' do
      frodo = Fabricate(:person)
      sam = Fabricate(:person, document_kind: :cnpj)
      albion = Fabricate(:user, email: 'albion@example.com')
      bastion = Fabricate(:user, email: 'bastion@example.com')
      transfer_one = Fabricate(:transfer, user: albion, buyer: sam)
      transfer_two = Fabricate(:transfer, user: bastion, buyer: frodo)

      people = described_class.filter_by_cnpj

      expect(people).to match_array([transfer_one])
    end
  end

  describe '.filter_by_creation' do
    it 'returns transfer in order of create date' do
      albion = Fabricate(:user, email: 'albion@example.com')
      bastion = Fabricate(:user, email: 'bastion@example.com')
      transfer_one = Fabricate(:transfer, user: albion, created_at: Date.today - 2)
      transfer_two = Fabricate(:transfer, user: bastion)

      people = described_class.filter_by_creation

      expect(people).to match_array([transfer_one, transfer_two])
    end
  end

  describe 'validations' do
    subject(:transfer) { Fabricate.build(:transfer) }

    it { is_expected.to validate_uniqueness_of(:vehicle) }
    it { is_expected.to validate_presence_of :doc_image }
  end

  it 'does not allows to transfer the same vehicle twice' do
    vehicle = Fabricate(:vehicle)
    user = Fabricate(:user)
    transfer = Fabricate(:transfer, user: user, vehicle: vehicle)

    expect { Fabricate(:transfer, user: user, vehicle: vehicle) }.to raise_error ActiveRecord::RecordInvalid
  end
end
