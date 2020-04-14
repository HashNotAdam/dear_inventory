# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Purchases < DearInventory::Model
      module Advanced
        class PutAway < DearInventory::Model
          extend T::Sig

          fields(
            PurchaseID: {
              name: :purchase_id,
              type: :Guid,
            },
            TaskID: {
              name: :task_id,
              type: :Guid,
            },
            Status: {
              name: :status,
              type: :String,
            },
            Lines: {
              name: :lines,
              type: :Array,
              model: DearInventory::Models::Purchases::Advanced::PutAwayLine,
            }
          )
        end
      end
    end
  end
end
