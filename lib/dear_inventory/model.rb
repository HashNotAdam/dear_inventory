# typed: true
# frozen_string_literal: true

require "json"

module DearInventory
  class Model
    extend T::Sig
    extend T::Helpers
    abstract!

    extend DearInventory::IsASubclass

    sig do
      params(
        fields: T::Hash[
          Symbol,
          T::Hash[Symbol, T.any(Symbol, T.class_of(DearInventory::Model))]
        ]
      ).void
    end
    def self.fields(fields)
      if const_defined?(:FIELDS, false)
        fields = remove_const(:FIELDS).merge(fields)
      end
      const_set(:FIELDS, fields.freeze)

      enumerate_fields do |_, specifications|
        __send__(:attr_reader, specifications[:name])
      end
    end

    sig { void }
    def self.enumerate_fields
      const_get(:FIELDS).each do |response_name, specifications|
        yield(response_name, specifications)
      end
    end

    sig do
      params(values: T.nilable(T::Hash[String, T.untyped])).void
    end
    def initialize(values)
      return if values.nil?

      self.class.enumerate_fields do |response_name, specifications|
        value = field_value(response_name, T.must(values), specifications)
        instance_variable_set(:"@#{specifications[:name]}", value)
      end
    end

    private

    # rubocop:disable Metrics/MethodLength
    sig do
      params(
        response_name: Symbol,
        values:
          T::Hash[String, T.untyped],
        specifications:
          T::Hash[Symbol, T.any(Symbol, T.class_of(DearInventory::Model))]
      ).returns(
        T.nilable(
          T.any(
            String, Numeric, T::Boolean,
            DearInventory::Model, T::Array[DearInventory::Model]
          )
        )
      )
    end
    def field_value(response_name, values, specifications)
      model = T.cast(
        specifications[:model],
        T.nilable(T.class_of(DearInventory::Model))
      )
      value = values[response_name.to_s]

      case specifications[:type]
      when :Array
        initialize_array_values_in_models(value, T.must(model))
      when :Hash
        T.must(model).new(value)
      else
        value
      end
    end
    # rubocop:enable Metrics/MethodLength

    sig do
      params(
        array: T.nilable(T::Array[T::Hash[String, T.untyped]]),
        model: T.class_of(DearInventory::Model)
      ).returns(T.nilable(T::Array[DearInventory::Model]))
    end
    def initialize_array_values_in_models(array, model)
      return if array.nil?

      array.each_with_object([]) do |values, records|
        records << model.new(values)
      end
    end
  end
end
