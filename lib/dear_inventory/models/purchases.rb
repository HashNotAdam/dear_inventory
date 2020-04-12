# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Purchases < DearInventory::Model
      extend T::Sig

      fields(
        ID: {
          name: :id,
          type: :Guid,
        },
        BlindReceipt: {
          name: :blind_receipt,
          type: :Boolean,
        },
        OrderNumber: {
          name: :order_number,
          type: :String,
        },
        Status: {
          name: :status,
          type: :String,
        },
        OrderDate: {
          name: :order_date,
          type: :Date,
        },
        InvoiceDate: {
          name: :invoice_date,
          type: :Date,
        },
        Supplier: {
          name: :customer,
          type: :String,
        },
        SupplierID: {
          name: :customer_id,
          type: :Guid,
        },
        InvoiceNumber: {
          name: :invoice_number,
          type: :String,
        },
        InvoiceAmount: {
          name: :invoice_amount,
          type: :Float,
        },
        PaidAmount: {
          name: :paid_amount,
          type: :Float,
        },
        InvoiceDueDate: {
          name: :invoice_due_date,
          type: :Date,
        },
        RequiredBy: {
          name: :required_by,
          type: :Date,
        },
        BaseCurrency: {
          name: :base_currency,
          type: :String,
        },
        SupplierCurrency: {
          name: :supplier_currency,
          type: :String,
        },
        CreditNoteNumber: {
          name: :credit_note_number,
          type: :String,
        },
        OrderStatus: {
          name: :order_status,
          type: :String,
        },
        StockReceivedStatus: {
          name: :stock_received_status,
          type: :String,
        },
        UnstockStatus: {
          name: :unstock_status,
          type: :String,
        },
        InvoiceStatus: {
          name: :invoice_status,
          type: :String,
        },
        CreditNoteStatus: {
          name: :credit_note_status,
          type: :String,
        },
        LastUpdatedDate: {
          name: :last_updated_date,
          type: :DateTime,
        },
        CombinedReceivingStatus: {
          name: :combined_receiving_status,
          type: :String,
        },
        CombinedInvoiceStatus: {
          name: :combined_invoice_status,
          type: :String,
        },
        CombinedPaymentStatus: {
          name: :combined_payment_status,
          type: :String,
        },
        Type: {
          name: :type,
          type: :String,
        },
        IsServiceOnly: {
          name: :is_service_only,
          type: :Boolean,
        },
        DropShipTaskID: {
          name: :drop_ship_task_id,
          type: :Guid,
        }
      )
    end
  end
end
