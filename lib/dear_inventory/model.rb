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
      private_constant :FIELDS

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
        values:
          T::Hash[String, T.nilable(T.any(DateTime, Numeric, String, Time))]
      ).void
    end
    def initialize(values)
      self.class.enumerate_fields do |response_name, specifications|
        value = values[response_name.to_s]
        instance_variable_set(:"@#{specifications[:name]}", value)
      end
    end
  end
end
