# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class PurchasesResults < DearInventory::Model
      extend T::Sig

      fields(
        Total: {
          name: :total,
          type: :Integer,
        },
        Page: {
          name: :page,
          type: :Integer,
        },
        PurchaseList: {
          name: :purchases,
          type: :ResultSet,
          model: DearInventory::Models::Purchases,
        }
      )
    end
  end
end
