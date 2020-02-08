# typed: true
# frozen_string_literal: true

require "json"

module DearInventory
  class Model
    extend T::Sig
    extend T::Helpers
    abstract!

    extend DearInventory::IsASubclass

    sig { params(fields: T::Hash[Symbol, T::Hash[Symbol, Symbol]]).void }
    def self.fields(fields)
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
      params(
        raw_values:
          T::Hash[String, T.nilable(T.any(DateTime, Numeric, String, Time))]
      ).void
    end
    def initialize(raw_values)
      self.class.enumerate_fields do |response_name, specifications|
        value = field_value(
          raw_values[response_name.to_s],
          specifications[:type]
        )
        instance_variable_set(:"@#{specifications[:name]}", value)
      end
    end

    protected

    sig do
      params(value: T.nilable(T.any(Numeric, String)), type: Symbol).
        returns(T.nilable(T.any(DateTime, Numeric, String)))
    end
    def field_value(value, type)
      return if value.nil?

      value = DateTime.parse(value) if type == :DateTime
      value
    end
  end
end
