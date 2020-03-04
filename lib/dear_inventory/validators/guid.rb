# typed: strict
# frozen_string_literal: true

module DearInventory
  module Validators
    class Guid < DearInventory::Validator
      extend T::Sig

      REGEX = T.let(
        [
          /\A[\da-f]{32}\z/i,
          /\A(urn:uuid:)?[\da-f]{8}-([\da-f]{4}-){3}[\da-f]{12}\z/i
        ].freeze,
        T::Array[Regexp]
      )

      sig { override.void }
      def call
        value = instance_variable_get(:@value)
        return if value.nil?
        return if REGEX.any? { |regex| value =~ regex }

        raise_error("#{value.inspect} is not a valid GUID")
      end
    end
  end
end
