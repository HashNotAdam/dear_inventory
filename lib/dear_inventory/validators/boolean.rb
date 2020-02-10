# typed: strict
# frozen_string_literal: true

module DearInventory
  module Validators
    class Boolean < DearInventory::Validator
      extend T::Sig

      sig { override.void }
      def call
        value = instance_variable_get(:@value)
        return if [true, false, nil].include?(value)

        raise_error("expected a Boolean but received #{value.inspect}")
      end
    end
  end
end
