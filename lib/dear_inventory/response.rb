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
    # rubocop:disable Metrics/MethodLength
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
      @model = T.let(@request.model.new(body), DearInventory::Model)

      @fields = T.let(nil, T.nilable(T::Array[Symbol]))
      @http_status = T.let(nil, T.nilable(Integer))
      @load_full_record = T.let(nil, T.nilable(T::Boolean))
      @num_records_paged = T.let(nil, T.nilable(Integer))
      @uri = T.let(nil, T.nilable(String))

      assign_values
      raise_error unless success?
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength

    sig { returns(T::Array[Symbol]) }
    def fields
      @fields ||= begin
        values = @request.model.const_get(:FIELDS).values.map do |field|
          field[:name]
        end
        values.unshift(:records) if @model.respond_to?(:records)
        values
      end
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

    sig { returns(T::Boolean) }
    def paginated?
      @model.respond_to?(:page)
    end

    sig { params(block: T.proc.params(arg0: DearInventory::Model).void).void }
    def each(&block)
      raise_not_paginated unless paginated?

      response = self
      loop do
        iterate_over_records(response, block)
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
      fields.each { |field| define_alias_method(field) }
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

    sig do
      params(
        response: DearInventory::Response,
        block: T.proc.params(arg0: DearInventory::Model).void
      ).void
    end
    def iterate_over_records(response, block)
      T.unsafe(response).records.each do |record|
        record = record.full_record if load_full_record?
        block.call(record)
      end
    end

    sig { returns(T::Boolean) }
    def load_full_record?
      @load_full_record ||=
        T.unsafe(self).records.first.respond_to?(:full_record)
    end
  end
end
