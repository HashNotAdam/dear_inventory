# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class BillOfMaterialsProduct < DearInventory::Model
      extend T::Sig

      fields(
        ComponentProductID: {
          name: :component_product_id,
          type: :Guid,
        },
        ProductCode: {
          name: :product_code,
          type: :String,
        },
        Name: {
          name: :name,
          type: :String,
        },
        Quantity: {
          name: :quantity,
          type: :Float,
        },
        WastagePercent: {
          name: :wastage_percent,
          type: :Float,
        },
        WastageQuantity: {
          name: :wastage_quantity,
          type: :Float,
        },
        CostPercentage: {
          name: :cost_percentage,
          type: :Float,
        }
      )
    end
  end
end
