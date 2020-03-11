# typed: strict
# frozen_string_literal: true

module DearInventory
  class PurchaseList < Resource
    class << self
      extend T::Sig

      # Purchase List
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::PurchaseList::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get, params: params, model: DearInventory::Models::PurchaseLists
        )
      end
    end
  end
end
