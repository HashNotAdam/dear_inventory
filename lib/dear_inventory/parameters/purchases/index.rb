# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    module Purchases
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
          required_by: {
            property: :RequiredBy,
            type: :DateTime,
            required: false,
          },
          updated_since: {
            property: :UpdatedSince,
            type: :DateTime,
            required: false,
          },
          order_status: {
            property: :OrderStatus,
            type: :Enum,
            values: ["VOIDED", "DRAFT", "AUTHORISED", "NOT AVAILABLE"],
            required: false,
          },
          restock_received_status: {
            property: :RestockReceivedStatus,
            type: :String,
            required: false,
          },
          invoice_status: {
            property: :InvoiceStatus,
            type: :Enum,
            values: ["VOIDED", "DRAFT", "AUTHORISED", "NOT AVAILABLE"],
            required: false,
          },
          credit_note_status: {
            property: :CreditNoteStatus,
            type: :Enum,
            values: ["VOIDED", "DRAFT", "AUTHORISED", "NOT AVAILABLE"],
            required: false,
          },
          unstock_status: {
            property: :UnstockStatus,
            type: :Enum,
            values: ["VOIDED", "DRAFT", "AUTHORISED", "NOT AVAILABLE"],
            required: false,
          },
          status: {
            property: :Status,
            type: :Enum,
            values: [
              "DRAFT", "VOIDED", "ORDERING", "ORDERED", "RECEIVING", "RECEIVED",
              "INVOICED", "CREDITED", "RECEIVING / CREDITED",
              "RECEIVED / CREDITED", "PARTIALLY INVOICED", "COMPLETED",
            ],
            required: false,
          },
          drop_ship_task_id: {
            property: :DropShipTaskID,
            type: :Guid,
            required: false,
          }
        )
      end
    end
  end
end
