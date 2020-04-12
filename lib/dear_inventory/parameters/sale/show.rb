# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    module Sale
      class Show < DearInventory::Parameters
        extend T::Sig

        fields(
          id: {
            property: :ID,
            type: :String,
            required: true,
          },
          combine_additional_charges: {
            property: :CombineAdditionalCharges,
            type: :Boolean,
            required: false,
          },
          hide_inventory_movements: {
            property: :HideInventoryMovements,
            type: :Boolean,
            required: false,
          },
          include_transactions: {
            property: :IncludeTransactions,
            type: :Boolean,
            required: false,
          }
        )
      end
    end
  end
end
