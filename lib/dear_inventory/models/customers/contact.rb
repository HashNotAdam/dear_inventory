# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Customers < DearInventory::Model
      class Contact < DearInventory::Model
        extend T::Sig

        fields(
          ID: {
            name: :id,
            type: :Guid,
          },
          Name: {
            name: :name,
            type: :Guid,
          },
          Phone: {
            name: :phone,
            type: :Guid,
          },
          MobilePhone: {
            name: :mobile_phone,
            type: :Guid,
          },
          Fax: {
            name: :fax,
            type: :Guid,
          },
          Email: {
            name: :email,
            type: :Guid,
          },
          Website: {
            name: :website,
            type: :Guid,
          },
          Comment: {
            name: :comment,
            type: :Guid,
          },
          Default: {
            name: :default,
            type: :Guid,
          },
          IncludeInEmail: {
            name: :include_in_email,
            type: :Guid,
          }
        )
      end
    end
  end
end
