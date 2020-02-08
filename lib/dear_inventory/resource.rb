# typed: strict
# frozen_string_literal: true

module DearInventory
  class Resource
    extend T::Sig
    extend DearInventory::IsASubclass

    sig do
      params(
        action: Symbol,
        endpoint: T.nilable(String),
        params: T::Hash[Symbol, T.untyped]
      ).returns(DearInventory::Response)
    end
    def request(action, endpoint: nil, params: {})
      url = resource_url(endpoint)
      params = DearInventory::Parameters.convert(self.class, endpoint, params)
      options = request_params(action, params)

      response = HTTP.headers(headers).public_send(action, url, options)
      response_class = DearInventory::EndpointClass.(
        class_type: "Responses", resource_class: self.class, endpoint: endpoint
      )
      response_class.new(response)
    end

    private

    URL_BASE = "https://inventory.dearsystems.com/ExternalApi/v2"

    sig { params(endpoint: T.nilable(String)).returns(String) }
    def resource_url(endpoint)
      resource = self.class.name.split("::").last
      url = "#{URL_BASE}/#{resource.downcase}"
      url += "/#{endpoint}" unless endpoint.nil?
      url
    end

    sig { returns(T::Hash[Symbol, String]) }
    def headers
      {
        "Content-Type": "application/json",
        "api-auth-accountid": DearInventory.config.require(:account_id),
        "api-auth-applicationkey": DearInventory.config.require(:key),
      }
    end

    sig do
      params(action: Symbol, params: DearInventory::Parameters).
        returns(T::Hash[Symbol, T.untyped])
    end
    def request_params(action, params)
      if action == :get
        { params: params.to_h }
      else
        { json: params.to_h }
      end
    end
  end
end
