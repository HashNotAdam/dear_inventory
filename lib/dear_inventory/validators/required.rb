# typed: strict
# frozen_string_literal: true

module DearInventory
  module Validators
    class Required < DearInventory::Validator
      extend T::Sig

      sig { override.void }
      def call
        return if instance_variable_get(:@value).present?

        raise_error("the field is required but no value was provided")
      end
    end
  end
end
