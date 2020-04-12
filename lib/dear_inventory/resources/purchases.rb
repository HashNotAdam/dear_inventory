# typed: strict
# frozen_string_literal: true

module DearInventory
  class Purchases < Resource
    RESOURCE_BASE = T.let("purchaselist", String)

    class << self
      extend T::Sig

      # Purchases
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Purchases::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get, params: params, model: DearInventory::Models::PurchasesResults
        )
      end

      alias call index
    end
  end
end
