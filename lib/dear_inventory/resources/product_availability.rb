# typed: strict
# frozen_string_literal: true

module DearInventory
  class ProductAvailability < Resource
    class << self
      extend T::Sig

      # ProductAvailability
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::ProductAvailability::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get,
          params: params,
          model: DearInventory::Models::ProductAvailabilityResults
        )
      end

      alias call index
    end

    private

    sig { params(_endpoint: T.nilable(String)).returns(String) }
    def resource_uri(_endpoint)
      self.class.const_get(:URI_BASE) + "/ref/productavailability"
    end
  end
end
