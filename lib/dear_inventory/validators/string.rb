# typed: strict
# frozen_string_literal: true

module DearInventory
  module Validators
    class String < DearInventory::Validator
      extend T::Sig

      sig { override.void }
      def call
        value = instance_variable_get(:@value)
        return if value.nil?

        check_type(value)
        check_length(value)
      end

      private

      def check_type(value)
        return if value.is_a?(::String)

        raise_error("expected a String but received #{value.inspect}")
      end

      def check_length(value)
        length = instance_variable_get(:@length)
        return if length.nil?
        return if value.length <= length

        raise_error("maximum length is #{length}")
      end
    end
  end
end
