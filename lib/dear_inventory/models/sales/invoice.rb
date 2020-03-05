# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class Invoice < DearInventory::Model
        extend T::Sig

        fields(
          TaskID: {
            name: :task_id,
            type: :Guid,
          },
          InvoiceNumber: {
            name: :invoice_number,
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
          InvoiceDate: {
            name: :invoice_date,
            type: :DateTime,
          },
          InvoiceDueDate: {
            name: :invoice_due_date,
            type: :DateTime,
          },
          CurrencyConversionRate: {
            name: :currency_conversion_rate,
            type: :Numeric,
          },
          BillingAddressLine1: {
            name: :billing_address_line_1,
            type: :String,
          },
          BillingAddressLine2: {
            name: :billing_address_line_2,
            type: :String,
          },
          LinkedFulfillmentNumber: {
            name: :linked_fulfillment_number,
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
          Payments: {
            name: :payments,
            type: :Array,
            model: DearInventory::Models::Sales::PaymentLine,
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
          Paid: {
            name: :paid,
            type: :Numeric,
          }
        )
      end
    end
  end
end
