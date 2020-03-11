# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Purchases
      class InvoiceAdditionalCharge < AdditionalCharge
        extend T::Sig

        fields(
          Reference: {
            name: :reference,
            type: :String,
          },
          Account: {
            name: :account,
            type: :String,
          }
        )
      end
    end
  end
end
