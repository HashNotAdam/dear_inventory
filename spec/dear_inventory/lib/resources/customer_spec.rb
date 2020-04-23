# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::Customer do
  describe ".index" do
    let(:response) { described_class.index(limit: 5) }

    it "gets a successful response" do
      DearInventory::Helpers::VCR.with_cassette("customer/index") do
        expect(response.http_status).to be 200
      end
    end

    it "receives a list of customers" do
      DearInventory::Helpers::VCR.with_cassette("customer/index") do
        expect(response.customers.length).to be 5
      end
    end

    it "aliases records to customers" do
      DearInventory::Helpers::VCR.with_cassette("customer/index") do
        expect(response.customers).to be response.records
      end
    end

    it "has modelled each customer as a DearInventory::Models::Customer" do
      DearInventory::Helpers::VCR.with_cassette("customer/index") do
        model_class = response.customers.map(&:class).uniq
        expect(model_class).to eq([DearInventory::Models::Customer])
      end
    end
  end

  describe ".call" do
    before { allow(described_class).to receive(:call) }

    it "is an alias of index" do
      described_class.call
      expect(described_class).to have_received(:call)
    end
  end
end
