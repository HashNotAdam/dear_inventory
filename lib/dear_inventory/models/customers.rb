# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Customers < DearInventory::Model
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
        CustomerList: {
          name: :customer_list,
          type: :Array,
          model: DearInventory::Models::Customer,
        }
      )
    end
  end
end
