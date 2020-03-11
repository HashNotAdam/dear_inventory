# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    module Purchase
      class Index < DearInventory::Parameters
        extend T::Sig

        fields(
          id: {
            property: :ID,
            type: :String,
            required: true,
          },
          combine_additional_charges: {
            property: :CombineAdditionalCharges,
            type: :Boolean,
            required: false,
          }
        )
      end
    end
  end
end
