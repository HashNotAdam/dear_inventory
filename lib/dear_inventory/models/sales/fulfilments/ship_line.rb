# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class Fulfilments
        class ShipLine < DearInventory::Model
          extend T::Sig

          fields({
            ID: {
              name: :id,
              type: :Guid,
            },
            ShipmentDate: {
              name: :shipment_date,
              type: :DateTime,
            },
            Carrier: {
              name: :carrier,
              type: :String,
            },
            Boxes: {
              name: :boxes,
              type: :String,
            },
            TrackingNumber: {
              name: :tracking_number,
              type: :String,
            },
            TrackingURL: {
              name: :tracking_url,
              type: :String,
            },
            IsShipped: {
              name: :is_shipped,
              type: :Boolean,
            },
          })
        end
      end
    end
  end
end
