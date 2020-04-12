# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class SalesResults < DearInventory::Model
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
        SaleList: {
          name: :sales,
          type: :ResultSet,
          model: DearInventory::Models::Sales,
        }
      )
    end
  end
end
