# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transfer::Ownership, type: :model do
  subject(:ownership) { described_class.new }

  describe '#save' do
    context 'with valid attributes' do
      subject(:ownership) { described_class.new attrs }

      let(:attrs) {
        {
          transfer: Fabricate.attributes_for(:transfer),
          buyer: Fabricate.attributes_for(
            :person,
            name: 'Zito',
            address_attributes: Fabricate.attributes_for(:address)
          ).except(:address_id)
        }
      }

      it 'returns true' do
        expect(ownership.save).to be_truthy
      end

      it 'changes the vehicle ownership' do
        vehicle = ownership.vehicle

        expect { ownership.save }.to change { vehicle.person }
      end

      it 'sets the buyer' do
        ownership.save

        expect(ownership.transfer.buyer).to have_attributes(name: 'Zito')
      end

      it 'sets the seller' do
        seller = ownership.vehicle.person

        ownership.save

        expect(ownership.transfer.seller).to eq seller
      end
    end

    context 'with invalid attributes' do
      it 'returns false' do
        user = Fabricate(:user, email: 'ownership@exaple.com')
        invalid_attrs = {
          transfer: Fabricate.attributes_for(:transfer, user: user),
          buyer: Fabricate.attributes_for(
            :person,
            name: '',
            address_attributes: Fabricate.attributes_for(:address)
          ).except(:address_id)
        }
        ownership = described_class.new invalid_attrs

        expect(ownership.save).to be_falsey
      end
    end
  end

  describe '#valid?' do
    context 'when all record are valid' do
      it 'returns true' do
        attrs = {
          transfer: Fabricate.attributes_for(:transfer),
          buyer: Fabricate.attributes_for(
            :person,
            address_attributes: Fabricate.attributes_for(:address)
          ).except(:address_id)
        }
        ownership = described_class.new attrs

        expect(ownership.valid?).to be_truthy
      end
    end

    context 'when buyer is invalid' do
      it 'returns false' do
        attrs = {
          transfer: Fabricate.attributes_for(:transfer),
          buyer: Fabricate.attributes_for(
            :person, name: '',
            address_attributes: Fabricate.attributes_for(:address)
          ).except(:address_id)
        }
        ownership = described_class.new attrs

        expect(ownership.valid?).to be_falsey
      end
    end

    context 'when transfer is invalid' do
      it 'returns false' do
        attrs = {
          transfer: Fabricate.attributes_for(:transfer, vehicle: nil),
          buyer: Fabricate.attributes_for(
            :person,
            address_attributes: Fabricate.attributes_for(:address)
          ).except(:address_id)
        }
        ownership = described_class.new attrs

        expect(ownership.valid?).to be_falsey
      end
    end
  end

  describe '#invalid?' do
    context 'when object is invalid' do
      it 'returns true' do
        attrs = {
          transfer: Fabricate.attributes_for(:transfer, vehicle: nil),
          buyer: Fabricate.attributes_for(
            :person,
            address_attributes: Fabricate.attributes_for(:address)
          ).except(:address_id)
        }
        ownership = described_class.new attrs

        expect(ownership.invalid?).to be_truthy
      end
    end

    context 'when object is valid' do
      it 'returns false' do
        attrs = {
          transfer: Fabricate.attributes_for(:transfer),
          buyer: Fabricate.attributes_for(
            :person,
            address_attributes: Fabricate.attributes_for(:address)
          ).except(:address_id)
        }
        ownership = described_class.new attrs

        expect(ownership.invalid?).to be_falsey
      end
    end
  end
end
