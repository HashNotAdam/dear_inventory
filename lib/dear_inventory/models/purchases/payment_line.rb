# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Purchases < DearInventory::Model
      class PaymentLine < DearInventory::Model
        extend T::Sig

        fields(
          ID: {
            name: :id,
            type: :Guid,
          },
          PurchaseID: {
            name: :purchase_id,
            type: :Guid,
          },
          TaskID: {
            name: :task_id,
            type: :Guid,
          },
          Reference: {
            name: :reference,
            type: :String,
          },
          Amount: {
            name: :amount,
            type: :BigDecimal,
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
            type: :BigDecimal,
          },
          DateCreated: {
            name: :date_created,
            type: :DateTime,
          }
        )
      end
    end
  end
end
