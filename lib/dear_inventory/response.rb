# typed: strict
# frozen_string_literal: true

module DearInventory
  class Response
    extend T::Sig
    extend DearInventory::IsASubclass

    sig do
      params(
        fields: T::Hash[
          Symbol,
          T::Hash[Symbol, T.any(Symbol, DearInventory::Model)]
        ]
      ).void
    end
    def self.fields(fields)
      const_set(:FIELDS, fields.freeze)

      fields.each do |response_name, specifications|
        define_method(specifications[:name]) do
          variable_name = "@#{specifications[:name]}"
          stored_value = instance_variable_get(variable_name)
          return stored_value unless stored_value.nil?

          value = T.unsafe(self).body[response_name.to_s]
          if specifications[:type] == :Array
            value = initialize_array_values_in_models(
              value, specifications[:model]
            )
          end

          instance_variable_set(variable_name, value)
        end
      end
    end

    sig { params(response: HTTP::Response).void }
    def initialize(response)
      @response = T.let(response, HTTP::Response)
      @body = T.let(nil, T.nilable(String))
      @http_status = T.let(nil, T.nilable(Integer))
      @url = T.let(nil, T.nilable(String))
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
    def url
      @url ||= T.unsafe(@response).url.to_s
    end

    protected

    def initialize_array_values_in_models(array, model)
      array.each_with_index do |value, index|
        array[index] = model.new(value)
      end

      array
    end

    private

    sig { returns(DearInventory::Error) }
    def raise_error
      raise T.unsafe(DearInventory::Error).
        new("Unknown error (#{http_status}): #{error}", self)
    end
  end
end
