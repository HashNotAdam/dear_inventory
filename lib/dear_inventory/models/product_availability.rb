# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class ProductAvailability < DearInventory::Model
      extend T::Sig

      fields(
        ID: {
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
        Barcode: {
          name: :barcode,
          type: :String,
        },
        Location: {
          name: :location,
          type: :String,
        },
        Bin: {
          name: :bin,
          type: :String,
        },
        ExpiryDate: {
          name: :expiry_date,
          type: :DateTime,
        },
        OnHand: {
          name: :on_hand,
          type: :Float,
        },
        Allocated: {
          name: :allocated,
          type: :Float,
        },
        Available: {
          name: :available,
          type: :Float,
        },
        OnOrder: {
          name: :on_order,
          type: :Float,
        },
        StockOnHand: {
          name: :stock_on_hand,
          type: :Float,
        }
      )
    end
  end
end
