# typed: strict
# frozen_string_literal: true

module DearInventory
  module Validators
    class Integer < DearInventory::Validator
      extend T::Sig

      sig { override.void }
      def call
        value = instance_variable_get(:@value)
        return if value.nil?
        return if value.is_a?(::Integer)

        raise_error("expected an Integer but received #{value.inspect}")
      end
    end
  end
end
