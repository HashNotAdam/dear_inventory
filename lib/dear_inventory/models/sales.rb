# typed: strict
# frozen_string_literal: true

module DearInventory
  module Models
    class Sales < DearInventory::Model
      extend T::Sig

      fields(
        SaleID: {
          name: :id,
          type: :Guid,
        },
        Customer: {
          name: :customer,
          type: :String,
        },
        CustomerID: {
          name: :customer_id,
          type: :Guid,
        },
        CustomerReference: {
          name: :customer_reference,
          type: :String,
        },
        InvoiceAmount: {
          name: :invoice_amount,
          type: :Float,
        },
        InvoiceDate: {
          name: :invoice_date,
          type: :Date,
        },
        InvoiceNumber: {
          name: :invoice_number,
          type: :String,
        },
        OrderDate: {
          name: :order_date,
          type: :Date,
        },
        OrderNumber: {
          name: :order_number,
          type: :String,
        },
        Status: {
          name: :status,
          type: :String,
        },
        PaidAmount: {
          name: :paid_amount,
          type: :Float,
        },
        InvoiceDueDate: {
          name: :invoice_due_date,
          type: :Date,
        },
        ShipBy: {
          name: :ship_by,
          type: :Date,
        },
        BaseCurrency: {
          name: :base_currency,
          type: :String,
        },
        CustomerCurrency: {
          name: :customer_currency,
          type: :String,
        },
        CreditNoteNumber: {
          name: :credit_note_number,
          type: :String,
        },
        Updated: {
          name: :updated,
          type: :DateTime,
        },
        QuoteStatus: {
          name: :quote_status,
          type: :String,
        },
        OrderStatus: {
          name: :order_status,
          type: :String,
        },
        CombinedPickingStatus: {
          name: :combined_picking_status,
          type: :String,
        },
        CombinedPackingStatus: {
          name: :combined_packing_status,
          type: :String,
        },
        CombinedShippingStatus: {
          name: :combined_shipping_status,
          type: :String,
        },
        FulFilmentStatus: {
          name: :fulfilment_status,
          type: :String,
        },
        CombinedInvoiceStatus: {
          name: :combined_invoice_status,
          type: :String,
        },
        CreditNoteStatus: {
          name: :credit_note_status,
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
        CombinedTrackingNumbers: {
          name: :combined_tracking_numbers,
          type: :String,
        },
        SourceChannel: {
          name: :source_channel,
          type: :String,
        },
        ExternalID: {
          name: :external_id,
          type: :String,
        }
      )

      sig { returns(DearInventory::Response) }
      def sale
        DearInventory::Sale.show(id: id)
      end
    end
  end
end
