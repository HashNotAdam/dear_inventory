# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Customer < DearInventory::Model
      extend T::Sig

      fields(
        ID: {
          name: :id,
          type: :Guid,
        },
        Name: {
          name: :name,
          type: :String,
        },
        Status: {
          name: :status,
          type: :String,
        },
        Currency: {
          name: :currency,
          type: :String,
        },
        PaymentTerm: {
          name: :payment_term,
          type: :String,
        },
        AccountReceivable: {
          name: :account_receivable,
          type: :String,
        },
        RevenueAccount: {
          name: :revenue_account,
          type: :String,
        },
        TaxRule: {
          name: :tax_rule,
          type: :String,
        },
        PriceTier: {
          name: :price_tier,
          type: :String,
        },
        Carrier: {
          name: :carrier,
          type: :String,
        },
        SalesRepresentative: {
          name: :sales_representative,
          type: :String,
        },
        Location: {
          name: :location,
          type: :String,
        },
        Discount: {
          name: :discount,
          type: :Integer,
        },
        Comments: {
          name: :comments,
          type: :String,
        },
        TaxNumber: {
          name: :tax_number,
          type: :Integer,
        },
        CreditLimit: {
          name: :credit_limit,
          type: :Integer,
        },
        Tags: {
          name: :tags,
          type: :String,
        },
        AttributeSet: {
          name: :attribute_set,
          type: :String,
        },
        AdditionalAttribute1: {
          name: :additional_attribute_1,
          type: :String,
        },
        AdditionalAttribute2: {
          name: :additional_attribute_2,
          type: :String,
        },
        AdditionalAttribute3: {
          name: :additional_attribute_3,
          type: :String,
        },
        AdditionalAttribute4: {
          name: :additional_attribute_4,
          type: :String,
        },
        AdditionalAttribute5: {
          name: :additional_attribute_5,
          type: :String,
        },
        AdditionalAttribute6: {
          name: :additional_attribute_6,
          type: :String,
        },
        AdditionalAttribute7: {
          name: :additional_attribute_7,
          type: :String,
        },
        AdditionalAttribute8: {
          name: :additional_attribute_8,
          type: :String,
        },
        AdditionalAttribute9: {
          name: :additional_attribute_9,
          type: :String,
        },
        LastModifiedOn: {
          name: :last_modified_on,
          type: :String,
        },
        Addresses: {
          name: :addresses,
          type: :Array,
          model: DearInventory::Models::Customers::Address,
        },
        Contacts: {
          name: :contacts,
          type: :Array,
          model: DearInventory::Models::Customers::Contact,
        }
      )
    end
  end
end
