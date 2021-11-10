# frozen_string_literal: true

require 'dry/schema'

# Enable info extension to use within matchers bellow.
Dry::Schema.load_extensions(:info)

RSpec::Matchers.define :requisite do |field, options|
  match do
    info = described_class.info
    field_info = info.dig(:keys, field)

    field_info[:required] && field_info[:type] == options[:filled].to_s
  end

  failure_message do
    "expected schema to requisite #{field} filled with type #{options[:filled]}"
  end
end
