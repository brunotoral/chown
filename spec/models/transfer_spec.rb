# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transfer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :vehicle }
    it { is_expected.to belong_to :person }
    it { is_expected.to belong_to :user }
  end
end
