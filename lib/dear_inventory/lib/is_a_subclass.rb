# typed: strict
# frozen_string_literal: true

module DearInventory
  module IsASubclass
    extend T::Sig

    sig { params(comparison_class: T.untyped).returns(T::Boolean) }
    def is_a?(comparison_class)
      return true if super
      return ancestors.include?(comparison_class) if self.class == Class

      false
    end
  end
end
