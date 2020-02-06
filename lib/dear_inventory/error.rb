# typed: true
# frozen_string_literal: true

module DearInventory
  class Error < StandardError
    attr_reader :message

    def initialize(message = nil)
      @message = message
    end
  end
end
