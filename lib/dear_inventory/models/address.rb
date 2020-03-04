# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Address < DearInventory::Model
      extend T::Sig

      fields({
        DisplayAddressLine1: {
          name: :display_address_line_1,
          type: :String,
        },
        DisplayAddressLine2: {
          name: :display_address_line_2,
          type: :String,
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
      })
    end
  end
end
