# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    module Sales
      class PaymentLine < DearInventory::Model
        extend T::Sig

        fields({
          ID: {
            name: :id,
            type: :Guid,
          },
          Reference: {
            name: :reference,
            type: :String,
          },
          Amount: {
            name: :amount,
            type: :Numeric,
          },
          DatePaid: {
            name: :date_paid,
            type: :DateTime,
          },
          Account: {
            name: :account,
            type: :String,
          },
          CurrencyRate: {
            name: :currency_rate,
            type: :Numeric,
          },
          DateCreated: {
            name: :date_created,
            type: :DateTime,
          },
        })
      end
    end
  end
end
