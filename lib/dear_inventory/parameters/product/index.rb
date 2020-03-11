# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    module Product
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
          modified_since: {
            property: :ModifiedSince,
            type: :DateTime,
            required: false,
          },
          include_deprecated: {
            property: :IncludeDeprecated,
            type: :Boolean,
            required: false,
          },
          include_bom: {
            property: :IncludeBOM,
            type: :Boolean,
            required: false,
          },
          include_suppliers: {
            property: :IncludeSuppliers,
            type: :Boolean,
            required: false,
          },
          include_movements: {
            property: :IncludeMovements,
            type: :Boolean,
            required: false,
          },
          include_attachments: {
            property: :IncludeAttachments,
            type: :Boolean,
            required: false,
          },
          include_reorder_levels: {
            property: :IncludeReorderLevels,
            type: :Boolean,
            required: false,
          }
        )
      end
    end
  end
end
