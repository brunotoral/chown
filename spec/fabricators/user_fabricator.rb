# frozen_string_literal: true

Fabricator(:user) do
  email 'test@example.com'
  password '1q2w3e4r'
  password_confirmation '1q2w3e4r'
  role :admin
end
