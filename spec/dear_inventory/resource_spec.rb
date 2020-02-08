# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::Resource do
  extend DearInventory::Helpers::Config
  configure

  it "sets the headers" do
    config = DearInventory.config
    config.account_id = "account_id"
    config.key = "key"

    resource = described_class.new
    headers = resource.send(:headers)
    expect(headers).to match(
      "Content-Type": "application/json",
      "api-auth-accountid": "account_id",
      "api-auth-applicationkey": "key"
    )
  end
end
