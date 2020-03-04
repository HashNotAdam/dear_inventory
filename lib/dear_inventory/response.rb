# typed: strict
# frozen_string_literal: true

module DearInventory
  class Response
    extend T::Sig
    extend DearInventory::IsASubclass

    class << self
      extend T::Sig

      sig do
        params(
          fields: T::Hash[
            Symbol,
            T::Hash[Symbol, T.any(Symbol, DearInventory::Model)]
          ]
        ).void
      end
      def fields(fields)
        const_set(:FIELDS, fields.freeze)

        fields.each do |response_name, specifications|
          name = T.cast(specifications[:name], Symbol)
          define_field_method(name, response_name, specifications)
        end
      end

      private

      sig do
        params(
          name: Symbol,
          response_name: Symbol,
          specifications: T::Hash[Symbol, T.any(Symbol, DearInventory::Model)]
        ).void
      end
      def define_field_method(name, response_name, specifications)
        define_method(name) do
          variable_name = "@#{specifications[:name]}"
          stored_value = instance_variable_get(variable_name)
          return stored_value unless stored_value.nil?

          value = T.unsafe(self).parameter_value(response_name, specifications)
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

    sig do
      params(
        response_name: Symbol,
        specifications: T::Hash[Symbol, T.any(Symbol, DearInventory::Model)]
      ).returns(
        T.nilable(
          T.any(
            String, Numeric,
            DearInventory::Model, T::Array[DearInventory::Model],
          )
        )
      )
    end
    def parameter_value(response_name, specifications)
      value = T.unsafe(self).body[response_name.to_s]

      if specifications[:type] == :Array
        model = specifications[:model]
        value = T.unsafe(self).initialize_array_values_in_models(value, model)
      end

      value
    end

    sig do
      params(
        array: T::Array[T::Hash[String, T.nilable(T.any(String, Numeric))]],
        model: T.class_of(DearInventory::Model)
      ).returns(T::Array[DearInventory::Model])
    end
    def initialize_array_values_in_models(array, model)
      array.each_with_object([]) do |values, records|
        records << model.new(values)
      end
    end

    private

    sig { returns(DearInventory::Error) }
    def raise_error
      raise T.unsafe(DearInventory::Error).
        new("Unknown error (#{http_status}): #{error}", self)
    end
  end
end
