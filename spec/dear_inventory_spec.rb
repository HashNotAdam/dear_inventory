# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory do
  it "has a version number" do
    expect(DearInventory::VERSION).not_to be nil
  end

  describe ".config" do
    it "returns the current configuration" do
      expect(described_class.config.class).to be DearInventory::Config
    end
  end

  describe ".configure" do
    after { DearInventory::Helpers::Config.configure }

    it "sets configuration variables passed into a block" do
      described_class.configure do |config|
        config.account_id = "account_id"
      end

      expect(described_class.config.account_id).to eq "account_id"
    end
  end
end
