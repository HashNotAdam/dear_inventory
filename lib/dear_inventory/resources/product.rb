# typed: strict
# frozen_string_literal: true

module DearInventory
  class Product < Resource
    class << self
      extend T::Sig

      # Product
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Product::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get, params: params, model: DearInventory::Models::Products
        )
      end

      alias call index
    end
  end
end
