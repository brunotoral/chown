# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transfer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :vehicle }
    it { is_expected.to belong_to :buyer }
    it { is_expected.to belong_to :seller }
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    subject(:buyer) { Fabricate(:person, name: 'Buyer', kind: :buyer) }
    subject(:transfer) { Fabricate.build(:transfer) }

    it { is_expected.to validate_uniqueness_of(:vehicle) } #.case_insensitive
    it { is_expected.to validate_presence_of :doc_image }
  end
end
