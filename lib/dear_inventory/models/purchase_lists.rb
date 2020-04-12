# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class PurchaseLists < DearInventory::Model
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
          name: :purchase_list,
          type: :ResultSet,
          model: DearInventory::Models::PurchaseList,
        }
      )
    end
  end
end
