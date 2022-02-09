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
      @retries = T.let(0, Integer)
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
    rescue DearInventory::APILimitError, HTTP::ConnectionError => e
      retry_request(e)
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
      if %i[get delete].include?(action)
        { params: params.to_h }
      else
        { json: params.to_h }
      end
    end

    ERROR_MESSAGE_PREFIXES = T.let(
      {
        DearInventory::APILimitError => "The API request limit was reached",
        HTTP::ConnectionError => "There was an error connecting to the API",
      }.freeze,
      T::Hash[T.class_of(StandardError), String]
    )
    MAX_RETRIES = T.let(4, Integer)
    RETRY_DELAY = T.let(5, Integer)

    sig { params(error: StandardError).returns(DearInventory::Response) }
    def retry_request(error)
      @retries += 1
      raise if @retries >= MAX_RETRIES

      message_prefix = ERROR_MESSAGE_PREFIXES[error.class]
      retry_time = @retries * RETRY_DELAY

      DearInventory.config.logger.warn(
        "#{message_prefix} while fetching #{@parameters.uri}. " \
        "The request will be tried again in #{retry_time} seconds"
      )

      sleep(retry_time)
      call
    end
  end
end
