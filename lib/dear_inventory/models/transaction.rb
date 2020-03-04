# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Transaction < DearInventory::Model
      extend T::Sig

      fields({
        TaskID: {
          name: :task_id,
          type: :Guid,
        },
        TransactionID: {
          name: :transaction_id,
          type: :Guid,
        },
        Debit: {
          name: :debit,
          type: :String,
        },
        Credit: {
          name: :credit,
          type: :String,
        },
        Description: {
          name: :description,
          type: :String,
        },
        Amount: {
          name: :credit,
          type: :Numeric,
        },
        EffectiveDate: {
          name: :description,
          type: :DateTime,
        },
      })
    end
  end
end
