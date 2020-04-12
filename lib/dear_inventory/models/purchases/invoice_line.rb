# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Purchases < DearInventory::Model
      class InvoiceLine < Line
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
