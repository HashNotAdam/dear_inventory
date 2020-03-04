# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class Order < DearInventory::Model
        extend T::Sig

        fields({
          SaleOrderNumber: {
            name: :sale_order_number,
            type: :String,
          },
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
            model: DearInventory::Models::Sales::Line,
          },
          AdditionalCharges: {
            name: :additional_charges,
            type: :Array,
            model: DearInventory::Models::AdditionalCharge,
          },
          TotalBeforeTax: {
            name: :total_before_tax,
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
        })
      end
    end
  end
end
