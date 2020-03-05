# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class AdditionalAttributes < DearInventory::Model
      extend T::Sig

      fields(
        AdditionalAttribute1: {
          name: :additional_attribute_1,
          type: :String,
        },
        AdditionalAttribute2: {
          name: :additional_attribute_2,
          type: :String,
        },
        AdditionalAttribute3: {
          name: :additional_attribute_3,
          type: :String,
        },
        AdditionalAttribute4: {
          name: :additional_attribute_4,
          type: :String,
        },
        AdditionalAttribute5: {
          name: :additional_attribute_5,
          type: :String,
        },
        AdditionalAttribute6: {
          name: :additional_attribute_6,
          type: :String,
        },
        AdditionalAttribute7: {
          name: :additional_attribute_7,
          type: :String,
        },
        AdditionalAttribute8: {
          name: :additional_attribute_8,
          type: :String,
        },
        AdditionalAttribute9: {
          name: :additional_attribute_9,
          type: :String,
        },
        AdditionalAttribute10: {
          name: :additional_attribute_10,
          type: :String,
        }
      )
    end
  end
end
