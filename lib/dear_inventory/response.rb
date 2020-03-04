# typed: strict
# frozen_string_literal: true

module DearInventory
  class Response
    extend T::Sig
    extend DearInventory::IsASubclass

    sig do
      params(
        model: T.class_of(DearInventory::Model),
        response: HTTP::Response
      ).void
    end
    def initialize(model:, response:)
      @model = T.let(nil, T.nilable(DearInventory::Model))
      @response = T.let(response, HTTP::Response)
      @body = T.let(nil, T.nilable(String))
      @http_status = T.let(nil, T.nilable(Integer))
      @uri = T.let(nil, T.nilable(String))

      assign_values(model)
      raise_error unless success?
    end

    sig { returns(T.untyped) }
    def body
      @body ||= JSON.parse(@response.body.to_s)
    end

    sig { returns(T.nilable(String)) }
    def error
      # body.fetch("message", nil) if body.respond_to?(:fetch)
      "Error goes here"
    end

    sig { returns(T::Hash[Symbol, String]) }
    def headers
      @response.headers
    end

    sig { returns(Integer) }
    def http_status
      @http_status ||= @response.status.code
    end

    sig { returns(T::Boolean) }
    def success?
      http_status == 200
    end

    sig { returns(String) }
    def uri
      @uri ||= @response.uri.to_s
    end

    private

    sig { params(model: T.class_of(DearInventory::Model)).void }
    def assign_values(model)
      @model = model.new(body)
      model.const_get(:FIELDS).each do |response_name, specifications|
        define_singleton_method(specifications[:name]) do
          @model.public_send(specifications[:name])
        end
      end
    end

    sig { returns(DearInventory::Error) }
    def raise_error
      raise T.unsafe(DearInventory::Error).
        new("Unknown error (#{http_status}): #{error}", self)
    end
  end
end
