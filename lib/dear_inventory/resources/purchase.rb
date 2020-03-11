# typed: strict
# frozen_string_literal: true

module DearInventory
  class Purchase < Resource
    class << self
      extend T::Sig

      # Purchase
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Purchase::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get, params: params, model: DearInventory::Models::Purchase
        )
      end
    end
  end
end
