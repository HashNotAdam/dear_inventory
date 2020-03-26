# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    module Customer
      class Index < DearInventory::Parameters
        extend T::Sig

        fields(
          id: {
            property: :ID,
            type: :Guid,
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
          modified_since: {
            property: :ModifiedSince,
            type: :DateTime,
            required: false,
          },
          include_deprecated: {
            property: :IncludeDeprecated,
            type: :Boolean,
            required: false,
          }
        )
      end
    end
  end
end
