# typed: strong
# frozen_string_literal: true

# This model has been designed to match the Dear API documentation, however,
# some of the field types don't make sense. Unfortunately, when trying to check
# what is being sent by the API, it turns out Dear is responding with an empty
# array even in situations where a movement exists for a product. The model will
# remain here incase the API is ever fixed but it will need to be reviewed in
# that case
module DearInventory
  module Models
    class Products < DearInventory::Model
      class Movement < DearInventory::Model
        extend T::Sig

        fields(
          TaskID: {
            name: :task_id,
            type: :Guid,
          },
          Type: {
            name: :type,
            type: :String,
          },
          Date: {
            name: :date,
            type: :DateTime,
          },
          Number: {
            name: :number,
            type: :String,
          },
          Status: {
            name: :status,
            type: :Integer,
          },
          Quantity: {
            name: :quantity,
            type: :Float,
          },
          Amount: {
            name: :amount,
            type: :BigDecimal,
          },
          Location: {
            name: :location,
            type: :Float,
          },
          BatchSN: {
            name: :batch_sn,
            type: :Float,
          },
          ExpiryDate: {
            name: :expiry_date,
            type: :DateTime,
          },
          FromTo: {
            name: :from_to,
            type: :String,
          }
        )
      end
    end
  end
end
