# frozen_string_literal: true

AddressSchema = Dry::Schema.Params do
  required(:state).filled(:string)
  required(:city).filled(:string)
  required(:district).filled(:string)
  required(:street).filled(:string)
  optional(:number).filled(:string)
  optional(:complement).filled(:string)
  required(:zip_code).filled(:string)
end
