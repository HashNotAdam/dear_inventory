# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Sales < DearInventory::Model
      class ManualJournalLine < DearInventory::Model
        extend T::Sig

        fields(
          Reference: {
            name: :reference,
            type: :String,
          },
          Amount: {
            name: :amount,
            type: :BigDecimal,
          },
          Date: {
            name: :date,
            type: :Date,
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
