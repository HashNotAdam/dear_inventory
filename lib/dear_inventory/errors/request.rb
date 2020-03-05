# typed: strict
# frozen_string_literal: true

module DearInventory
  class RequestError < Error
    extend T::Sig

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

    sig { returns(T.nilable(String)) }
    def http_body
      @response&.error || @response&.body&.to_s
    end

    sig { returns(T.nilable(T::Hash[Symbol, String])) }
    def http_headers
      @response&.headers
    end

    sig { returns(T.nilable(Integer)) }
    def http_status
      @response&.http_status
    end

    sig { returns(T.nilable(String)) }
    def uri
      @response&.uri&.to_s
    end
  end
end
