# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Purchases
      class StockLine < DearInventory::Model
        extend T::Sig

        fields(
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
          LocationID: {
            name: :location_id,
            type: :Guid,
          },
          Received: {
            name: :received,
            type: :Boolean,
          },
          BatchSN: {
            name: :batch_sn,
            type: :String,
          },
          SupplierSKU: {
            name: :supplier_sku,
            type: :String,
          },
          ExpiryDate: {
            name: :expiry_date,
            type: :Date,
          },
          CardID: {
            name: :card_id,
            type: :Guid,
          }
        )
      end
    end
  end
end
