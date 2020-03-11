# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Purchases
      class Order < DearInventory::Model
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
          Lines: {
            name: :lines,
            type: :Array,
            model: DearInventory::Models::Purchases::Line,
          },
          AdditionalCharges: {
            name: :additional_charges,
            type: :Array,
            model: DearInventory::Models::Purchases::AdditionalCharge,
          },
          Prepayments: {
            name: :prepayments,
            type: :Array,
            model: DearInventory::Models::Sales::PaymentLine,
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
