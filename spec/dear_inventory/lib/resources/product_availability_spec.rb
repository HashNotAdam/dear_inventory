# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::ProductAvailability do
  describe ".index" do
    let(:response) { described_class.index(limit: 5) }

    it "gets a successful response" do
      DearInventory::Helpers::VCR.with_cassette("product_availability/index") do
        expect(response.http_status).to be 200
      end
    end

    it "receives a list of product_availabilities" do
      DearInventory::Helpers::VCR.with_cassette("product_availability/index") do
        expect(response.product_availabilities.length).to be 5
      end
    end

    it "aliases records to product_availabilities" do
      DearInventory::Helpers::VCR.with_cassette("product_availability/index") do
        expect(response.product_availabilities).to be response.records
      end
    end

    it "has modelled each product_availability as a " \
       "DearInventory::Models::ProductAvailability" do
      DearInventory::Helpers::VCR.with_cassette("product_availability/index") do
        model_class = response.product_availabilities.map(&:class).uniq
        expect(model_class).to eq([DearInventory::Models::ProductAvailability])
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
