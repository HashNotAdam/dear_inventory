# typed: strict
# frozen_string_literal: true

module DearInventory
  module Validators
    class Required < DearInventory::Validator
      extend T::Sig

      sig { override.void }
      def call
        return if present?(instance_variable_get(:@value))

        raise_error("the field is required but no value was provided")
      end

      private

      def present?(value)
        !blank?(value)
      end

      def blank?(value)
        value&.empty? || !value
      end
    end
  end
end
