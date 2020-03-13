# typed: strict
# frozen_string_literal: true

module DearInventory
  class Response
    extend T::Sig
    extend DearInventory::IsASubclass

    sig { returns(DearInventory::Models::Request) }
    attr_reader :request
    sig { returns(HTTP::Response) }
    attr_reader :response

    sig do
      params(
        request: DearInventory::Models::Request,
        response: HTTP::Response
      ).void
    end
    def initialize(request:, response:)
      @request = T.let(request, DearInventory::Models::Request)
      @response = T.let(response, HTTP::Response)
      @http_status = T.let(nil, T.nilable(Integer))
      @model = T.let(nil, T.nilable(DearInventory::Model))
      @uri = T.let(nil, T.nilable(String))

      assign_values
      raise_error unless success?
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

    sig { returns(DearInventory::Response) }
    def next_page
      unless T.must(@model).respond_to?(:page)
        raise DearInventory::NotPaginatedError.new(uri: uri)
      end

      request = @request.dup
      T.unsafe(request.params).page = T.unsafe(@model).page + 1
      DearInventory::Request.(request)
    end

    sig { returns(T::Boolean) }
    def success?
      http_status == 200
    end

    sig { returns(String) }
    def uri
      @uri ||= @response.uri.to_s
    end

    protected

    sig { returns(T.untyped) }
    def body
      JSON.parse(@response.body.to_s)
    end

    private

    sig { void }
    def assign_values
      @model = @request.model.new(body)
      @request.model.const_get(:FIELDS).each do |_, specifications|
        define_singleton_method(specifications[:name]) do
          @model.public_send(specifications[:name])
        end
      end
    end

    sig { returns(DearInventory::Error) }
    def raise_error
      raise T.unsafe(DearInventory::Error).
        new("Unknown error (#{http_status}): #{error}")
    end
  end
end
