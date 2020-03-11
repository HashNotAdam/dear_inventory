# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class ReorderLevel < DearInventory::Model
      extend T::Sig

      fields(
        LocationID: {
          name: :location_id,
          type: :Guid,
        },
        LocationName: {
          name: :location_name,
          type: :String,
        },
        MinimumBeforeReorder: {
          name: :minimum_before_reorder,
          type: :Float,
        },
        ReorderQuantity: {
          name: :reorder_quantity,
          type: :Float,
        },
        StockLocator: {
          name: :stock_locator,
          type: :String,
        },
        PickZones: {
          name: :pick_zones,
          type: :String,
        }
      )
    end
  end
end
