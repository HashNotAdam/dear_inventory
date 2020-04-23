# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    module ProductAvailability
      class Index < DearInventory::Parameters
        extend T::Sig

        fields(
          id: {
            property: :ID,
            type: :String,
            required: false,
          },
          page: {
            property: :Page,
            type: :Integer,
            required: false,
          },
          limit: {
            property: :Limit,
            type: :Integer,
            required: false,
          },
          name: {
            property: :Name,
            type: :String,
            required: false,
          },
          sku: {
            property: :Sku,
            type: :String,
            required: false,
          },
          location: {
            property: :Location,
            type: :String,
            required: false,
          },
          batch: {
            property: :Batch,
            type: :String,
            required: false,
          },
          category: {
            property: :Category,
            type: :String,
            required: false,
          }
        )
      end
    end
  end
end
