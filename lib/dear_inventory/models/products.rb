# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Products < DearInventory::Model
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
        Products: {
          name: :products,
          type: :Array,
          model: DearInventory::Models::Product,
        }
      )
    end
  end
end
