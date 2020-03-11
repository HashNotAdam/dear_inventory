# typed: strict
# frozen_string_literal: true

module DearInventory
  class SaleList < Resource
    class << self
      extend T::Sig

      # Sale List
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::SaleList::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get, params: params, model: DearInventory::Models::SaleLists
        )
      end
    end
  end
end
