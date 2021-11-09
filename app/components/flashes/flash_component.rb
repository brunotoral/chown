# frozen_string_literal: true

module Flashes
  class FlashComponent < ApplicationComponent
    def initialize(kind:, message:)
      @kind = kind
      @message = message
    end

    def classes
      %W[notification p-3 is-#{@kind}]
    end
  end
end
