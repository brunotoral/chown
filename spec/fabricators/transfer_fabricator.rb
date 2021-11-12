# frozen_string_literal: true

Fabricator(:transfer) do
  vehicle
  user
  seller { Fabricate(:person) }
  byuer { Fabricate(:person, name: 'Mozart', document_number: '99999999999') }
end
