# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Sales < DearInventory::Model
      class Quote < DearInventory::Model
        extend T::Sig

        fields(
          Memo: {
            name: :memo,
            type: :String,
          },
          Status: {
            name: :status,
            type: :String,
          },
          Prepayments: {
            name: :prepayments,
            type: :Array,
            model: DearInventory::Models::Sales::PaymentLine,
          },
          Lines: {
            name: :lines,
            type: :Array,
            model: DearInventory::Models::Sales::Line,
          },
          AdditionalCharges: {
            name: :additional_charges,
            type: :Array,
            model: DearInventory::Models::Sales::AdditionalCharge,
          },
          TotalBeforeTax: {
            name: :total_before_tax,
            type: :BigDecimal,
          },
          Tax: {
            name: :tax,
            type: :BigDecimal,
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
