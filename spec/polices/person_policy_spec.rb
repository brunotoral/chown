# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonPolicy do
  subject { PersonPolicy.new(user, person) }

  let(:person) { Fabricate(:person) }

  context 'when loged in with an moderator' do
    let(:user) { Fabricate(:user, role: :moderator) }

    it { should permit(:show) }

    it { should_not permit(:create) }
    it { should_not permit(:new) }
    it { should_not permit(:update) }
    it { should_not permit(:edit) }
    it { should_not permit(:destroy) }
  end

  context 'when loged in with an admin' do
    let(:user) { Fabricate(:user) }

    it { should permit(:show) }
    it { should permit(:create) }
    it { should permit(:new) }
    it { should permit(:update) }
    it { should permit(:edit) }
    it { should permit(:destroy) }
  end
end
