# typed: strong
# frozen_string_literal: true

module DearInventory
  class Error < StandardError
    extend T::Sig

    sig { returns(T.nilable(String)) }
    attr_reader :message

    sig { params(message: T.nilable(String)).void }
    def initialize(message = nil)
      @message = T.let(message, T.nilable(String))
    end
  end
end
