# typed: strict
# frozen_string_literal: true

module DearInventory
  class Resource
    extend T::Sig
    extend DearInventory::IsASubclass

    sig do
      params(
        action: Symbol,
        model: T.class_of(DearInventory::Model),
        endpoint: T.nilable(String),
        params: T::Hash[Symbol, T.untyped]
      ).returns(DearInventory::Response)
    end
    def request(action, model:, endpoint: nil, params: {})
      uri = resource_uri(endpoint)
      params = DearInventory::Parameters.convert(self.class, endpoint, params)

      request = DearInventory::Models::Request.new(
        action: action,
        model: model,
        params: params,
        uri: uri
      )
      DearInventory::Request.(request)
    end

    private

    URI_BASE = "https://inventory.dearsystems.com/ExternalApi/v2"

    sig { params(endpoint: T.nilable(String)).returns(String) }
    def resource_uri(endpoint)
      resource = T.must(self.class.name).split("::").last
      uri = "#{URI_BASE}/#{T.must(resource).downcase}"
      uri += "/#{endpoint}" unless endpoint.nil?
      uri
    end
  end
end
