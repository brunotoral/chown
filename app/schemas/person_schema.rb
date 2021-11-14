# frozen_string_literal: true

PersonSchema = Dry::Schema.Params do
  required(:name).filled(:string)
  required(:document_number).filled(:string)
  required(:document_kind).filled(:string)
end
