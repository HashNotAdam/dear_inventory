# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::Purchase do
  describe ".index" do
    let(:response) { described_class.index(limit: 5) }

    it "gets a successful response" do
      DearInventory::Helpers::VCR.with_cassette("purchase/index") do
        expect(response.http_status).to be 200
      end
    end

    it "receives a list of purchases" do
      DearInventory::Helpers::VCR.with_cassette("purchase/index") do
        expect(response.purchases.length).to be 5
      end
    end

    it "aliases records to purchases" do
      DearInventory::Helpers::VCR.with_cassette("purchase/index") do
        expect(response.purchases).to be response.records
      end
    end

    it "has modelled each purchase as a DearInventory::Models::Purchases" do
      DearInventory::Helpers::VCR.with_cassette("purchase/index") do
        model_class = response.purchases.map(&:class).uniq
        expect(model_class).to eq([DearInventory::Models::Purchases])
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
    context "when an invalid ID is supplied" do
      it "reaches the endpoint but receives a bad request error" do
        DearInventory::Helpers::VCR.with_cassette("purchase/show/invalid") do
          expect { described_class.show(id: "Incorrect") }.
            to raise_error(DearInventory::BadRequestError)
        end
      end
    end
  end
end
