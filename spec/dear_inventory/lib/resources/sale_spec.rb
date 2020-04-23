# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::Sale do
  let(:index_response) { described_class.index(limit: 5) }

  describe ".index" do
    it "gets a successful response" do
      DearInventory::Helpers::VCR.with_cassette("sale/index") do
        expect(index_response.http_status).to be 200
      end
    end

    it "receives a list of sales" do
      DearInventory::Helpers::VCR.with_cassette("sale/index") do
        expect(index_response.sales.length).to be 5
      end
    end

    it "aliases records to sales" do
      DearInventory::Helpers::VCR.with_cassette("sale/index") do
        expect(index_response.sales).to be index_response.records
      end
    end

    it "has modelled each sale as a DearInventory::Models::Sales" do
      DearInventory::Helpers::VCR.with_cassette("sale/index") do
        model_class = index_response.sales.map(&:class).uniq
        expect(model_class).to eq([DearInventory::Models::Sales])
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

  describe ".show" do
    let(:sale_id) do
      id = nil

      DearInventory::Helpers::VCR.with_cassette("sale/index") do
        id = index_response.sales.first.id
      end

      id
    end
    let(:show_response) { described_class.show(id: sale_id) }

    it "gets a successful response" do
      DearInventory::Helpers::VCR.with_cassette("sale/show") do
        expect(show_response.http_status).to be 200
      end
    end

    it "returns the correct sale" do
      DearInventory::Helpers::VCR.with_cassette("sale/show") do
        expect(show_response.id).to eq sale_id
      end
    end
  end
end
