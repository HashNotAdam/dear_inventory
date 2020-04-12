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
        response: HTTP::Response,
        num_previous_records: Integer
      ).void
    end
    def initialize(request:, response:, num_previous_records: 0)
      @request = T.let(request, DearInventory::Models::Request)
      @response = T.let(response, HTTP::Response)
      @num_previous_records = T.let(num_previous_records, Integer)
      @http_status = T.let(nil, T.nilable(Integer))
      @model = T.let(nil, T.nilable(DearInventory::Model))
      @uri = T.let(nil, T.nilable(String))

      assign_values
      raise_error unless success?
    end

    sig { returns(T.nilable(String)) }
    def error
      return body.fetch("Exception", nil) if body.respond_to?(:fetch)

      body
    end

    sig { returns(T::Hash[Symbol, String]) }
    def headers
      @response.headers
    end

    sig { returns(Integer) }
    def http_status
      @http_status ||= @response.status.code
    end

    # rubocop:disable Metrics/AbcSize
    sig { returns(DearInventory::Response) }
    def next_page
      unless T.must(@model).respond_to?(:page)
        raise DearInventory::NotPaginatedError.new(uri: uri)
      end
      raise DearInventory::NoMorePagesError unless next_page?

      request = @request.dup
      T.unsafe(request.params).page = T.unsafe(@model).page + 1

      DearInventory::Request.(request, num_previous_records: num_records_paged)
    end
    # rubocop:enable Metrics/AbcSize

    def next_page?
      unless T.must(@model).respond_to?(:page)
        raise DearInventory::NotPaginatedError.new(uri: uri)
      end

      num_records_paged < total
    end

    def num_records_paged
      unless T.must(@model).respond_to?(:page)
        raise DearInventory::NotPaginatedError.new(uri: uri)
      end

      @num_records_paged ||= @num_previous_records + records.count
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
        define_alias_method(specifications[:name])
      end

      define_alias_method(:records) if @model.respond_to?(:records)
    end

    sig { params(method_name: Symbol).void }
    def define_alias_method(method_name)
      define_singleton_method(method_name) do
        @model.public_send(method_name)
      end
    end

    sig { returns(DearInventory::Error) }
    def raise_error
      if http_status == 400
        raise T.unsafe(DearInventory::BadRequestError).new(error, self)
      end

      raise T.unsafe(DearInventory::Error).
        new("Unknown error (#{http_status}): #{error}")
    end
  end
end
