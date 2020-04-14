# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Purchases < DearInventory::Model
      module Advanced
        class PutAwayLine < StockLine
          extend T::Sig

          fields(
            CardID: {
              name: :card_id,
              type: :CardID,
            }
          )
        end
      end
    end
  end
end
