# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Sales < DearInventory::Model
      class CreditNote < DearInventory::Model
        extend T::Sig

        fields(
          TaskID: {
            name: :task_id,
            type: :Guid,
          },
          CreditNoteInvoiceNumber: {
            name: :credit_note_invoice_number,
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
          CreditNoteDate: {
            name: :credit_note_date,
            type: :Date,
          },
          CreditNoteNumber: {
            name: :credit_note_number,
            type: :String,
          },
          CreditNoteConversionRate: {
            name: :credit_note_conversion_rate,
            type: :BigDecimal,
          },
          Lines: {
            name: :lines,
            type: :Array,
            model: DearInventory::Models::Sales::InvoiceLine,
          },
          AdditionalCharges: {
            name: :additional_charges,
            type: :Array,
            model: DearInventory::Models::Sales::InvoiceAdditionalCharge,
          },
          Refunds: {
            name: :refunds,
            type: :Array,
            model: DearInventory::Models::Sales::PaymentLine,
          },
          Restock: {
            name: :restock,
            type: :Array,
            model: DearInventory::Models::Sales::Fulfilments::PickPackLine,
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
