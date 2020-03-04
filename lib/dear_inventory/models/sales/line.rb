# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class Line < DearInventory::Model
        extend T::Sig

        fields({
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
            type: :Numeric,
          },
          Price: {
            name: :price,
            type: :Numeric,
          },
          Discount: {
            name: :discount,
            type: :Numeric,
          },
          Tax: {
            name: :tax,
            type: :Numeric,
          },
          AverageCost: {
            name: :average_cost,
            type: :Numeric,
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
            type: :Numeric,
          },
        })
      end
    end
  end
end
