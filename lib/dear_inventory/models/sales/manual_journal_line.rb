# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class ManualJournalLine < DearInventory::Model
        extend T::Sig

        fields(
          Reference: {
            name: :reference,
            type: :String,
          },
          Amount: {
            name: :amount,
            type: :Numeric,
          },
          Date: {
            name: :date,
            type: :DateTime,
          },
          Debit: {
            name: :debit,
            type: :String,
          },
          Credit: {
            name: :credit,
            type: :String,
          }
        )
      end
    end
  end
end
