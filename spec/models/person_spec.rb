# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :vehicles }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :document_number }
    it { is_expected.to validate_presence_of :kind }
  end
end
