# typed: strict
# frozen_string_literal: true

module DearInventory
  class AdvancedPurchase < Resource
    class << self
      extend T::Sig

      # Advanced Purchase
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::AdvancedPurchase::Show
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def show(params = {})
        new.request(
          :get,
          endpoint: "show",
          model: DearInventory::Models::AdvancedPurchase,
          params: params
        )
      end
    end
  end
end
