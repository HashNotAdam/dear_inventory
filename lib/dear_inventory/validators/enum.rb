# typed: strict
# frozen_string_literal: true

module DearInventory
  module Validators
    class Enum < DearInventory::Validator
      extend T::Sig

      sig { override.void }
      def call
        value = instance_variable_get(:@value)
        return if value.nil?
        return if T.must(@values).include?(value)

        raise_error(
          "expected one of " \
          "#{T.must(@values).map(&:inspect).join(", ")} " \
          "but received #{value.inspect}"
        )
      end
    end
  end
end
