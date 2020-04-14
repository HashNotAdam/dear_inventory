# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Purchases < DearInventory::Model
      module Advanced
        class Stock < DearInventory::Model
          extend T::Sig

          fields(
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
              model: DearInventory::Models::Purchases::Advanced::StockLine,
            }
          )
        end
      end
    end
  end
end
