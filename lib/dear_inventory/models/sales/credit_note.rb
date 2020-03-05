# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
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
            type: :DateTime,
          },
          CreditNoteNumber: {
            name: :credit_note_number,
            type: :String,
          },
          CreditNoteConversionRate: {
            name: :credit_note_conversion_rate,
            type: :Numeric,
          },
          Lines: {
            name: :lines,
            type: :Array,
            model: DearInventory::Models::Sales::InvoiceLine,
          },
          AdditionalCharges: {
            name: :additional_charges,
            type: :Array,
            model: DearInventory::Models::AdditionalCharge,
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
            type: :Numeric,
          },
          Tax: {
            name: :tax,
            type: :Numeric,
          },
          Total: {
            name: :total,
            type: :Numeric,
          }
        )
      end
    end
  end
end
