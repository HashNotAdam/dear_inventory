# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class InvoiceAdditionalCharge < AdditionalCharge
        extend T::Sig

        fields(
          Account: {
            name: :account,
            type: :String,
          }
        )
      end
    end
  end
end
