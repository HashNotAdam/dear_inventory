# typed: strict
# frozen_string_literal: true

module DearInventory
  class Purchase < Resource
    class << self
      extend T::Sig

      # Purchases
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Purchase::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get,
          endpoint: "index",
          model: DearInventory::Models::PurchasesResults,
          params: params
        )
      end

      alias call index

      # Purchase
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Purchase::Show
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def show(params = {})
        new.request(
          :get,
          endpoint: "show",
          model: DearInventory::Models::Purchase,
          params: params
        )
      end
    end

    private

    sig { params(endpoint: T.nilable(String)).returns(String) }
    def resource_uri(endpoint)
      case endpoint
      when "index"
        self.class.const_get(:URI_BASE) + "/purchaselist"
      when "show"
        self.class.const_get(:URI_BASE) + "/purchase"
      end
    end
  end
end
