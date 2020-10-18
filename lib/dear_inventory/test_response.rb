# typed: strict
# frozen_string_literal: true

module DearInventory
  class TestResponse < Response
    extend T::Sig
    extend DearInventory::IsASubclass

    sig { returns(DearInventory::Models::Request) }
    attr_reader :request
    sig { returns(HTTP::Response) }
    attr_reader :response

    # rubocop:disable Metrics/AbcSize
    sig do
      params(
        request: DearInventory::Models::TestRequest,
        body: T.nilable(T::Hash[String, T.untyped]),
        num_previous_records: Integer
      ).void
    end
    def initialize(request:, body:, num_previous_records: 0)
      @request = T.let(request, DearInventory::Models::Request)
      @num_previous_records = T.let(num_previous_records, Integer)

      @fields = T.let(nil, T.nilable(T::Array[Symbol]))
      @http_status = T.let(nil, T.nilable(Integer))
      @load_full_record = T.let(nil, T.nilable(T::Boolean))
      @num_records_paged = T.let(nil, T.nilable(Integer))
      @uri = T.let(nil, T.nilable(String))

      raise_error unless success?

      @model = T.let(@request.model.new(body), DearInventory::Model)
      assign_values
    end
    # rubocop:enable Metrics/AbcSize

    sig { returns(Integer) }
    def http_status
      200
    end
  end
end
