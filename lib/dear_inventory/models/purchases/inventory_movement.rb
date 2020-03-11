# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Purchases
      class InventoryMovement < DearInventory::Model
        extend T::Sig

        fields(
          TaskID: {
            name: :task_id,
            type: :Guid,
          },
          ProductID: {
            name: :product_id,
            type: :Guid,
          },
          Date: {
            name: :date,
            type: :Date,
          },
          COGS: {
            name: :cogs,
            type: :BigDecimal,
          }
        )
      end
    end
  end
end
