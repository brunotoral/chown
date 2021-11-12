# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flashes::Component, type: :component do
  context 'when no flashes are provided' do
    it 'renders nothing' do
      render_inline(described_class.new(flashes: {}))

      expect(rendered_component).to be_empty
    end
  end

  context 'when a message is provided' do
    it 'renders the message' do
      flashes = {
        alert: 'alert message'
      }

      render_inline(described_class.new(flashes: flashes))

      expect(rendered_component).to have_text 'alert message'
    end
  end
end
