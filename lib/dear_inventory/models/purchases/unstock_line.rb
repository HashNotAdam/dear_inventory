# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Purchases < DearInventory::Model
      class UnstockLine < DearInventory::Model
        extend T::Sig

        fields(
          CardID: {
            name: :card_id,
            type: :Guid,
          },
          Date: {
            name: :date,
            type: :Date,
          },
          Quantity: {
            name: :quantity,
            type: :Float,
          },
          ProductID: {
            name: :product_id,
            type: :Guid,
          },
          SKU: {
            name: :sku,
            type: :String,
          },
          Name: {
            name: :name,
            type: :String,
          },
          Location: {
            name: :location,
            type: :String,
          },
          BatchSN: {
            name: :batch_sn,
            type: :String,
          },
          ExpiryDate: {
            name: :expiry_date,
            type: :Date,
          }
        )
      end
    end
  end
end
