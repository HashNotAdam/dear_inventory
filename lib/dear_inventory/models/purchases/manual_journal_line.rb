# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Purchases
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
          },
          IsSystem: {
            name: :is_system,
            type: :Boolean,
          }
        )
      end
    end
  end
end
