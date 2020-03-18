# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class Line < DearInventory::Model
        extend T::Sig

        fields(
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
          Quantity: {
            name: :quantity,
            type: :Float,
          },
          Price: {
            name: :price,
            type: :BigDecimal,
          },
          Discount: {
            name: :discount,
            type: :BigDecimal,
          },
          Tax: {
            name: :tax,
            type: :BigDecimal,
          },
          AverageCost: {
            name: :average_cost,
            type: :BigDecimal,
          },
          TaxRule: {
            name: :tax_rule,
            type: :String,
          },
          Comment: {
            name: :comment,
            type: :String,
          },
          Total: {
            name: :total,
            type: :BigDecimal,
          }
        )
      end
    end
  end
end
