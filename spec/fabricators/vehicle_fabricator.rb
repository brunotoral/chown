# frozen_string_literal: true

Fabricator(:vehicle) do
  person
  license_plate 'ABC0099'
  renavam '123999123777'
  crv_number '999000999000'
  crv_date '21-07-1999'
end
