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
      request = DearInventory::Models::Request.new(
        action: action,
        model: model,
        params: DearInventory::Parameters.convert(self.class, endpoint, params),
        uri: resource_uri(endpoint)
      )
      DearInventory::Request.(request)
    end

    private

    URI_BASE = T.let("https://inventory.dearsystems.com/ExternalApi/v2", String)

    sig { params(_endpoint: T.nilable(String)).returns(String) }
    def resource_uri(_endpoint)
      resource = T.must(self.class.name).split("::").last
      camel_case = Strings::Urlize.(T.must(resource))

      "#{URI_BASE}/#{camel_case}"
    end
  end
end
