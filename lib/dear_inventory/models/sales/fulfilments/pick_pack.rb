# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class Fulfilments
        class PickPack < DearInventory::Model
          extend T::Sig

          fields(
            Status: {
              name: :status,
              type: :String,
            },
            Lines: {
              name: :lines,
              type: :Array,
              model: DearInventory::Models::Sales::Fulfilments::PickPackLine,
            }
          )
        end
      end
    end
  end
end
