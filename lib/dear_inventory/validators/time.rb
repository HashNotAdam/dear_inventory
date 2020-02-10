# typed: strict
# frozen_string_literal: true
require "pry"
module DearInventory
  module Validators
    class DateTime < DearInventory::Validator
      extend T::Sig

      sig { override.void }
      def call
        value = instance_variable_get(:@value)
        return if value.nil?
        return if value.respond_to?(:strftime)

        raise_error(
          "expected a DateTime but received the #{value.class} #{value.inspect}"
        )
      end
    end
  end
end
