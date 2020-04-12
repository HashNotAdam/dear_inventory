# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Sales < DearInventory::Model
      class Fulfilments
        class Ship < DearInventory::Model
          extend T::Sig

          fields(
            Status: {
              name: :status,
              type: :String,
            },
            RequireBy: {
              name: :require_by,
              type: :Date,
            },
            ShippingAddress: {
              name: :status,
              type: :Hash,
              model: DearInventory::Models::ShippingAddress,
            },
            Lines: {
              name: :lines,
              type: :Array,
              model: DearInventory::Models::Sales::Fulfilments::ShipLine,
            }
          )
        end
      end
    end
  end
end
