# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::Product do
  describe ".index" do
    let(:response) { described_class.index(limit: 5) }

    it "gets a successful response" do
      DearInventory::Helpers::VCR.with_cassette("product/index") do
        expect(response.http_status).to be 200
      end
    end

    it "receives a list of products" do
      DearInventory::Helpers::VCR.with_cassette("product/index") do
        expect(response.products.length).to be 5
      end
    end

    it "aliases records to products" do
      DearInventory::Helpers::VCR.with_cassette("product/index") do
        expect(response.products).to be response.records
      end
    end

    it "has modelled each product as a DearInventory::Models::Product" do
      DearInventory::Helpers::VCR.with_cassette("product/index") do
        model_class = response.products.map(&:class).uniq
        expect(model_class).to eq([DearInventory::Models::Product])
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
