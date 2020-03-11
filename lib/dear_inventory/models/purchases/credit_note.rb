# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Purchases
      class CreditNote < DearInventory::Model
        extend T::Sig

        fields(
          CreditNoteNumber: {
            name: :credit_note_number,
            type: :String,
          },
          CreditNoteDate: {
            name: :credit_note_date,
            type: :Date,
          },
          Status: {
            name: :status,
            type: :String,
          },
          Lines: {
            name: :lines,
            type: :Array,
            model: DearInventory::Models::Purchases::InvoiceLine,
          },
          AdditionalCharges: {
            name: :additional_charges,
            type: :Array,
            model: DearInventory::Models::Purchases::InvoiceAdditionalCharge,
          },
          Refunds: {
            name: :refunds,
            type: :Array,
            model: DearInventory::Models::Sales::PaymentLine,
          },
          Unstock: {
            name: :unstock,
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
