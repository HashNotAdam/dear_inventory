# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Purchases < DearInventory::Model
      class ManualJournal < DearInventory::Model
        extend T::Sig

        fields(
          Status: {
            name: :status,
            type: :String,
          },
          Lines: {
            name: :lines,
            type: :Array,
            model: DearInventory::Models::Purchases::ManualJournalLine,
          }
        )
      end
    end
  end
end
