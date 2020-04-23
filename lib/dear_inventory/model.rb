# typed: true
# frozen_string_literal: true

require "bigdecimal/util"
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
      ancestor = T.must(ancestors[1])
      if ancestor.const_defined?(:FIELDS)
        fields = ancestor.const_get(:FIELDS).merge(fields)
      end
      const_set(:FIELDS, fields.freeze)

      define_readers
    end

    sig { void }
    def self.define_readers
      enumerate_fields do |_, specifications|
        __send__(:attr_reader, specifications[:name])

        if specifications[:type] == :ResultSet
          alias_method :records, specifications[:name]
        end
      end
    end

    sig { void }
    def self.enumerate_fields
      const_get(:FIELDS).each do |response_name, specifications|
        yield(response_name, specifications)
      end
    end

    alias initialize_abstract initialize

    sig do
      params(values: T.nilable(T::Hash[T.any(String, Symbol), T.untyped])).void
    end
    def initialize(values = nil)
      initialize_abstract

      return if values.nil?

      self.class.enumerate_fields do |response_name, specifications|
        value = field_value(response_name, T.must(values), specifications)
        instance_variable_set(:"@#{specifications[:name]}", value)
      end
    end

    sig { returns(T::Hash[Symbol, T.untyped]) }
    def to_h
      {}.tap do |hash|
        self.class.enumerate_fields do |_, specifications|
          key = specifications[:name]
          hash[key] = public_send(key)
        end
      end
    end

    private

    sig do
      params(
        response_name: Symbol,
        values:
          T::Hash[T.any(String, Symbol), T.untyped],
        specifications:
          T::Hash[Symbol, T.any(Symbol, T.class_of(DearInventory::Model))]
      ).returns(T.untyped)
    end
    def field_value(response_name, values, specifications)
      model = T.cast(
        specifications[:model],
        T.nilable(T.class_of(DearInventory::Model))
      )
      value = values[response_name.to_s]
      return if value == ""

      format_value(value, specifications[:type], model)
    end

    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/MethodLength
    def format_value(value, type, model)
      case type
      when :Array, :ResultSet
        initialize_array_values_in_models(value, T.must(model))
      when :BigDecimal
        value.to_d
      when :Date
        ::Date.parse(value) unless value.nil?
      when :DateTime
        ::DateTime.parse(value) unless value.nil?
      when :Hash
        T.must(model).new(value)
      else
        value
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/MethodLength

    sig do
      params(
        array: T.nilable(T::Array[T::Hash[T.any(String, Symbol), T.untyped]]),
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
