# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  class_methods do
    def filter_by(*names)
      @filters = names
    end

    def filters
      @filters ||= []
    end
  end

  def apply_filters(relation, filters: nil)
    filters ||= self.class.filters

    return relation if filters.empty?

    filters.inject(relation) do |rel, filter|
      next rel if params[filter].blank?

      rel.public_send("filter_by_#{filter}", params[filter])
    end
  end
end
