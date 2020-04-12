# typed: strict
# frozen_string_literal: true

module DearInventory
  class Request
    extend T::Sig

    sig do
      params(
        parameters: DearInventory::Models::Request,
        num_previous_records: Integer
      ).returns(DearInventory::Response)
    end
    def self.call(parameters, num_previous_records: 0)
      new(parameters, num_previous_records: num_previous_records).call
    end

    sig do
      params(
        parameters: DearInventory::Models::Request,
        num_previous_records: Integer
      ).void
    end
    def initialize(parameters, num_previous_records: 0)
      @parameters = T.let(parameters, DearInventory::Models::Request)
      @num_previous_records = T.let(num_previous_records, Integer)
    end

    sig { returns(DearInventory::Response) }
    def call
      options = request_params(@parameters.action, @parameters.params)
      response = HTTP.headers(headers).
        public_send(@parameters.action, @parameters.uri, options)

      DearInventory::Response.new(
        response: response,
        request: @parameters,
        num_previous_records: @num_previous_records
      )
    end

    private

    sig { returns(T::Hash[Symbol, String]) }
    def headers
      {
        "Content-Type": "application/json",
        "api-auth-accountid": DearInventory.config.require(:account_id),
        "api-auth-applicationkey": DearInventory.config.require(:key),
      }
    end

    sig do
      params(action: Symbol, params: DearInventory::Parameters).
        returns(T::Hash[Symbol, T::Hash[Symbol, T.untyped]])
    end
    def request_params(action, params)
      if action == :get
        { params: params.to_h }
      else
        { json: params.to_h }
      end
    end
  end
end
