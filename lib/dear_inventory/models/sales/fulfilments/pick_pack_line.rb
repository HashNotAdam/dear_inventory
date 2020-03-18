# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class Fulfilments
        class PickPackLine < DearInventory::Model
          extend T::Sig

          fields(
            ProductID: {
              name: :product_id,
              type: :Guid,
            },
            SKU: {
              name: :sku,
              type: :String,
            },
            Name: {
              name: :name,
              type: :String,
            },
            Location: {
              name: :location,
              type: :String,
            },
            LocationID: {
              name: :location_id,
              type: :Guid,
            },
            Quantity: {
              name: :quantity,
              type: :Float,
            },
            BatchSN: {
              name: :batch_sn,
              type: :String,
            },
            ExpiryDate: {
              name: :expiry_date,
              type: :DateTime,
            },
            Box: {
              name: :box,
              type: :String,
            },
            WarrantyRegistrationNumber: {
              name: :warranty_registration_number,
              type: :String,
            }
          )
        end
      end
    end
  end
end
