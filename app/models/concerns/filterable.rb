# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filtered(filters: [])
      return self.all unless filters.any?

      filters.reduce(self) do |s, filter|
        s.public_send "filter_by_#{filter}"
      end
    end
  end
end
