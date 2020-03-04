# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class AdditionalCharge < DearInventory::Model
      extend T::Sig

      fields({
        Description: {
          name: :description,
          type: :String,
        },
        Price: {
          name: :price,
          type: :Numeric,
        },
        Quantity: {
          name: :quantity,
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
        Total: {
          name: :total,
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
      })
    end
  end
end
