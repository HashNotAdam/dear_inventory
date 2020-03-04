# typed: strict
# frozen_string_literal: true

module DearInventory
  module IsASubclass
    extend T::Sig

    sig { params(comparison_class: T.untyped).returns(T::Boolean) }
    def is_a?(comparison_class)
      return true if super

      if T.unsafe(self).class == Class
        return T.unsafe(self).ancestors.include?(comparison_class)
      end

      false
    end
  end
end
