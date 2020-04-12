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

    # rubocop:disable Metrics/AbcSize
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

      @num_records_paged = T.let(nil, T.nilable(Integer))
      @http_status = T.let(nil, T.nilable(Integer))
      @model = T.let(nil, T.nilable(DearInventory::Model))
      @uri = T.let(nil, T.nilable(String))

      assign_values
      raise_error unless success?
    end
    # rubocop:enable Metrics/AbcSize

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

    sig { returns(T::Boolean) }
    def paginated?
      T.must(@model).respond_to?(:page)
    end

    sig { params(_blk: T.proc.params(arg0: DearInventory::Model).void).void }
    def each(&_blk)
      raise_not_paginated unless paginated?

      response = self
      loop do
        T.unsafe(response).records.each { |record| yield(record) }
        break unless response.next_page?

        response = response.next_page
      end
    end

    sig { returns(DearInventory::Response) }
    def next_page
      raise_not_paginated unless paginated?
      raise DearInventory::NoMorePagesError unless next_page?

      request = @request.dup
      T.unsafe(request.params).page = T.unsafe(@model).page + 1

      DearInventory::Request.(request, num_previous_records: num_records_paged)
    end

    sig { returns(T::Boolean) }
    def next_page?
      raise_not_paginated unless paginated?

      num_records_paged < T.unsafe(self).total
    end

    sig { returns(Integer) }
    def num_records_paged
      @num_records_paged ||= begin
        raise_not_paginated unless paginated?

        @num_previous_records + T.unsafe(self).records.count
      end
    end

    sig { void }
    def raise_not_paginated
      raise DearInventory::NotPaginatedError.new(uri: uri)
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
