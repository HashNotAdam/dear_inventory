# typed: strict
# frozen_string_literal: true

module DearInventory
  class RequestError < Error
    extend T::Sig

    sig { returns(T.nilable(DearInventory::Response)) }
    attr_reader :response

    sig do
      params(
        message: T.nilable(String),
        response: T.nilable(DearInventory::Response)
      ).void
    end
    def initialize(message = nil, response = nil)
      super(message)

      @response = T.let(response, T.nilable(DearInventory::Response))
    end
  end
end
