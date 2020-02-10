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
          returns(DearInventory::Responses::SaleList::Index)
      end
      def index(params: {})
        T.cast(
          new.request(:get, params: params),
          DearInventory::Responses::SaleList::Index
        )
      end
    end
  end
end
