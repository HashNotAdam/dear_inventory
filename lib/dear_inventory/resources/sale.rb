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
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(:get, params: params, model: DearInventory::Models::Sale)
      end

      alias call index
    end
  end
end
