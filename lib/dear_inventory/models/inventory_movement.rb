# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
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
          type: :DateTime,
        },
        COGS: {
          name: :cogs,
          type: :Numeric,
        }
      )
    end
  end
end
