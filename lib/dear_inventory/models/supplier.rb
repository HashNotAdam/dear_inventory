# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Supplier < DearInventory::Model
      extend T::Sig

      fields(
        SupplierID: {
          name: :supplier_id,
          type: :Guid,
        },
        SupplierName: {
          name: :supplier_name,
          type: :String,
        },
        SupplierInventoryCode: {
          name: :supplier_inventory_code,
          type: :String,
        },
        SupplierProductName: {
          name: :supplier_product_name,
          type: :String,
        },
        Cost: {
          name: :cost,
          type: :BigDecimal,
        },
        FixedCost: {
          name: :fixed_cost,
          type: :BigDecimal,
        },
        Currency: {
          name: :currency,
          type: :String,
        },
        DropShip: {
          name: :drop_ship,
          type: :Boolean,
        },
        URL: {
          name: :url,
          type: :String,
        }
      )
    end
  end
end
