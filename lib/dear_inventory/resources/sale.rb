# typed: strict
# frozen_string_literal: true

module DearInventory
  class Sale < Resource
    class << self
      extend T::Sig

      # Sales
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Sale::Index
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def index(params = {})
        new.request(
          :get,
          endpoint: "index",
          model: DearInventory::Models::SalesResults,
          params: params
        )
      end

      alias call index

      # Sale
      #
      # @param params [Hash] URL query string parameters that conform to
      #   DearInventory::Parameters::Sale::Show
      sig do
        params(params: T::Hash[Symbol, T.untyped]).
          returns(DearInventory::Response)
      end
      def show(params = {})
        new.request(
          :get,
          endpoint: "show",
          model: DearInventory::Models::Sale,
          params: params
        )
      end
    end

    private

    sig { params(endpoint: T.nilable(String)).returns(String) }
    def resource_uri(endpoint)
      case endpoint
      when "index"
        self.class.const_get(:URI_BASE) + "/salelist"
      when "show"
        self.class.const_get(:URI_BASE) + "/sale"
      end
    end
  end
end
