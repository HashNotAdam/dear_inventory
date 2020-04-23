# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::AdvancedPurchase do
  context "when an invalid ID is supplied" do
    let(:cassette) { "advanced_purchase/show/invalid" }

    it "reaches the endpoint but receives a bad request error" do
      DearInventory::Helpers::VCR.with_cassette(cassette) do
        expect { described_class.show(id: "Incorrect") }.
          to raise_error(DearInventory::BadRequestError)
      end
    end
  end
end
