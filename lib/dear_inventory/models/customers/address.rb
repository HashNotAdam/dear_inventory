# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Customers < DearInventory::Model
      class Address < DearInventory::Model
        extend T::Sig

        fields(
          TaskID: {
            name: :task_id,
            type: :Guid,
          },
          Line1: {
            name: :line_1,
            type: :String,
          },
          Line2: {
            name: :line_2,
            type: :String,
          },
          City: {
            name: :city,
            type: :String,
          },
          State: {
            name: :state,
            type: :String,
          },
          Postcode: {
            name: :postcode,
            type: :String,
          },
          Country: {
            name: :country,
            type: :String,
          },
          Type: {
            name: :type,
            type: :String,
          },
          DefaultForType: {
            name: :default_for_type,
            type: :Boolean,
          }
        )
      end
    end
  end
end
