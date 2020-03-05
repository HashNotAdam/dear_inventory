# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Sale < DearInventory::Model
      extend T::Sig

      fields(
        ID: {
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
        Contact: {
          name: :contact,
          type: :String,
        },
        Phone: {
          name: :phone,
          type: :String,
        },
        Email: {
          name: :email,
          type: :String,
        },
        DefaultAccount: {
          name: :default_account,
          type: :String,
        },
        SkipQuote: {
          name: :skip_quote,
          type: :Boolean,
        },
        BillingAddress: {
          name: :billing_address,
          type: :Hash,
          model: DearInventory::Models::Address,
        },
        ShippingAddress: {
          name: :shipping_address,
          type: :Hash,
          model: DearInventory::Models::ShippingAddress,
        },
        BaseCurrency: {
          name: :base_currency,
          type: :String,
        },
        CustomerCurrency: {
          name: :customer_currency,
          type: :String,
        },
        TaxRule: {
          name: :tax_rule,
          type: :String,
        },
        TaxCalculation: {
          name: :tax_calculation,
          type: :String,
        },
        Terms: {
          name: :terms,
          type: :String,
        },
        PriceTier: {
          name: :price_tier,
          type: :String,
        },
        ShipBy: {
          name: :ship_by,
          type: :Date,
        },
        Location: {
          name: :location,
          type: :String,
        },
        SaleOrderDate: {
          name: :sale_order_date,
          type: :Date,
        },
        LastModifiedOn: {
          name: :last_modified_on,
          type: :DateTime,
        },
        Note: {
          name: :note,
          type: :String,
        },
        CustomerReference: {
          name: :customer_reference,
          type: :String,
        },
        COGSAmount: {
          name: :cogs_amount,
          type: :Numeric,
        },
        Status: {
          name: :status,
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
        CombinedPaymentStatus: {
          name: :combined_payment_status,
          type: :String,
        },
        CombinedTrackingNumbers: {
          name: :combined_tracking_numbers,
          type: :String,
        },
        Carrier: {
          name: :carrier,
          type: :String,
        },
        CurrencyRate: {
          name: :currency_rate,
          type: :Numeric,
        },
        SalesRepresentative: {
          name: :sales_representative,
          type: :String,
        },
        Type: {
          name: :type,
          type: :String,
        },
        SourceChannel: {
          name: :source_channel,
          type: :String,
        },
        ExternalID: {
          name: :external_id,
          type: :String,
        },
        ServiceOnly: {
          name: :service_only,
          type: :Boolean,
        },
        Quote: {
          name: :quote,
          type: :Hash,
          model: DearInventory::Models::Sales::Quote,
        },
        Order: {
          name: :order,
          type: :Hash,
          model: DearInventory::Models::Sales::Order,
        },
        Fulfilments: {
          name: :fulfilments,
          type: :Array,
          model: DearInventory::Models::Sales::Fulfilment,
        },
        Invoices: {
          name: :invoices,
          type: :Array,
          model: DearInventory::Models::Sales::Invoice,
        },
        CreditNotes: {
          name: :credit_notes,
          type: :Array,
          model: DearInventory::Models::Sales::CreditNote,
        },
        ManualJournals: {
          name: :manual_journals,
          type: :Hash,
          model: DearInventory::Models::Sales::ManualJournal,
        },
        AdditionalAttributes: {
          name: :additional_attributes,
          type: :Hash,
          model: DearInventory::Models::AdditionalAttributes,
        },
        Attachments: {
          name: :attachments,
          type: :Array,
          model: DearInventory::Models::Attachment,
        },
        InventoryMovements: {
          name: :inventory_movements,
          type: :Array,
          model: DearInventory::Models::InventoryMovement,
        },
        Transactions: {
          name: :transactions,
          type: :Array,
          model: DearInventory::Models::InventoryMovement,
        }
      )
    end
  end
end
