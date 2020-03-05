# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class Fulfilment < DearInventory::Model
        extend T::Sig

        fields(
          TaskID: {
            name: :task_id,
            type: :Guid,
          },
          FulfillmentNumber: {
            name: :fulfillment_number,
            type: :Numeric,
          },
          LinkedInvoiceNumber: {
            name: :linked_invoice_number,
            type: :String,
          },
          FulFilmentStatus: {
            name: :fulfilment_status,
            type: :String,
          },
          Pick: {
            name: :pick,
            type: :Hash,
            model: DearInventory::Models::Sales::Fulfilments::PickPack,
          },
          Pack: {
            name: :pack,
            type: :Hash,
            model: DearInventory::Models::Sales::Fulfilments::PickPack,
          },
          Ship: {
            name: :ship,
            type: :Hash,
            model: DearInventory::Models::Sales::Fulfilments::Ship,
          }
        )
      end
    end
  end
end
