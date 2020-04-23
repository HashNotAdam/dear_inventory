# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::Request do
  after { DearInventory::Helpers::Config.configure }

  let(:parameters) do
    DearInventory::Models::Request.new(
      action: :action,
      model: DearInventory::Model,
      params: DearInventory::Parameters.new({}),
      uri: "https://uri.dev"
    )
  end

  it "sets the headers" do
    config = DearInventory.config
    config.account_id = "account_id"
    config.key = "key"

    request = described_class.new(parameters)
    headers = request.__send__(:headers)
    expect(headers).to match(
      "Content-Type": "application/json",
      "api-auth-accountid": "account_id",
      "api-auth-applicationkey": "key"
    )
  end
end
