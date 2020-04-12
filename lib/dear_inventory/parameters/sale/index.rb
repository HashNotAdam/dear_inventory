# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    module Sale
      class Index < DearInventory::Parameters
        extend T::Sig

        fields(
          page: {
            property: :Page,
            type: :Integer,
            required: false,
          },
          limit: {
            property: :Limit,
            type: :Integer,
            required: false,
          },
          search: {
            property: :Search,
            type: :String,
            required: false,
          },
          created_since: {
            property: :CreatedSince,
            type: :DateTime,
            required: false,
          },
          updated_since: {
            property: :UpdatedSince,
            type: :DateTime,
            required: false,
          },
          ship_by: {
            property: :ShipBy,
            type: :DateTime,
            required: false,
          },
          quote_status: {
            property: :QuoteStatus,
            type: :Enum,
            values: ["NOT AVAILABLE", "DRAFT", "AUTHORISED", "VOIDED"],
            required: false,
          },
          order_status: {
            property: :OrderStatus,
            type: :Enum,
            values: [
              "NOT AVAILABLE", "DRAFT", "AUTHORISED", "VOIDED", "AUTH_NO_ALLOC",
              "FULFILLED", "CLOSED",
            ],
            required: false,
          },
          combined_pick_status: {
            property: :CombinedPickStatus,
            type: :Enum,
            values: [
              "VOIDED", "NOT AVAILABLE", "PICKED", "PICKING", "NOT PICKED",
              "PARTIALLY PICKED",
            ],
            required: false,
          },
          combined_pack_status: {
            property: :CombinedPackStatus,
            type: :Enum,
            values: [
              "VOIDED", "NOT AVAILABLE", "PACKED", "PACKING", "NOT PACKED",
              "PARTIALLY PACKED",
            ],
            required: false,
          },
          combined_shipp_status: {
            property: :CombinedShippStatus,
            type: :Enum,
            values: [
              "VOIDED", "NOT AVAILABLE", "SHIPPED", "SHIPPING", "NOT SHIPPED",
              "PARTIALLY SHIPPED",
            ],
            required: false,
          },
          combined_invoice_status: {
            property: :CombinedInvoiceStatus,
            type: :Enum,
            values: ["VOIDED", "DRAFT", "AUTHORISED", "NOT AVAILABLE", "PAID"],
            required: false,
          },
          credit_note_status: {
            property: :CreditNoteStatus,
            type: :Enum,
            values: ["VOIDED", "DRAFT", "AUTHORISED", "NOT AVAILABLE"],
            required: false,
          },
          external_id: {
            property: :ExternalID,
            type: :String,
            required: false,
          },
          status: {
            property: :Status,
            type: :Enum,
            values: %w[
              DRAFT VOIDED ESTIMATING ESTIMATED ORDERING ORDERED BACKORDERED
              PICKING PICKED PACKING PACKED SHIPPING INVOICING INVOICED CREDITED
              COMPLETED
            ],
            required: false,
          },
          ready_for_shipping: {
            property: :ReadyForShipping,
            type: :Boolean,
            required: false,
          }
        )
      end
    end
  end
end
