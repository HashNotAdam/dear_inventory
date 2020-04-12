# typed: strict
# frozen_string_literal: true

module DearInventory
  class Sales < Resource
    RESOURCE_BASE = T.let("salelist", String)

    class << self
      extend T::Sig

      # Sale List
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Sales::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get, params: params, model: DearInventory::Models::SalesResults
        )
      end

      alias call index
    end
  end
end
