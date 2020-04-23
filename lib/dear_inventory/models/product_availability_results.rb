# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class ProductAvailabilityResults < DearInventory::Model
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
        ProductAvailabilityList: {
          name: :product_availabilities,
          type: :ResultSet,
          model: DearInventory::Models::ProductAvailability,
        }
      )
    end
  end
end
