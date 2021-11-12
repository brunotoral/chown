# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flashes::FlashComponent, type: :component do
  it 'renders the message' do
    render_inline(described_class.new(kind: 'success', message: 'hi there'))

    expect(rendered_component).to have_text 'hi there'
  end

  it 'renders the correct css class' do
    render_inline(described_class.new(kind: 'success', message: 'hi there'))

    expect(rendered_component).to have_css 'div.is-success'
  end
end
