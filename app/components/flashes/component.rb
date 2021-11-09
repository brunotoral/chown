# frozen_string_literal: true

module Flashes
  class Component < ApplicationComponent
    def initialize(flashes:)
      @flashes = flashes
    end

    def render?
      @flashes.any?
    end
  end
end
