# typed: strict
# frozen_string_literal: true

module DearInventory
  class Sale < Resource
    class << self
      extend T::Sig

      # Sale
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Sale::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Responses::Sale::Index)
      end
      def index(params: {})
        T.cast(
          new.request(:get, params: params),
          DearInventory::Responses::Sale::Index
        )
      end
    end
  end
end
