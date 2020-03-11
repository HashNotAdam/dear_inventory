# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Purchases
      class Invoice < DearInventory::Model
        extend T::Sig

        fields(
          TaskID: {
            name: :task_id,
            type: :Guid,
          },
          CombineAdditionalCharges: {
            name: :combine_additional_charges,
            type: :Boolean,
          },
          InvoiceDate: {
            name: :invoice_date,
            type: :Date,
          },
          InvoiceDueDate: {
            name: :invoice_due_date,
            type: :Date,
          },
          InvoiceNumber: {
            name: :invoice_number,
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
            model: DearInventory::Models::Purchases::InvoiceAdditionalCharge,
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
          },
          InvoiceTotalAmount: {
            name: :invoice_total_amount,
            type: :BigDecimal,
          },
          InvoiceTotalTaxAmount: {
            name: :invoice_total_tax_amount,
            type: :BigDecimal,
          }
        )
      end
    end
  end
end
