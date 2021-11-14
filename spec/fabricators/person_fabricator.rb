# frozen_string_literal: true

Fabricator(:person) do
  name 'Carolina IV'
  document_number '12312332100'
  document_kind :cpf
  address { Fabricate.build(:address) }
end
