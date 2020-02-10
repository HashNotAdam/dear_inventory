# typed: strong
# frozen_string_literal: true

module DearInventory
  module Responses
    module SaleList
      class Index < DearInventory::Response
        extend T::Sig

        fields({
          Total: {
            name: :total,
            type: :Integer,
          },
          Page: {
            name: :page,
            type: :Integer,
          },
          SaleList: {
            name: :sale_list,
            type: :Array,
            model: DearInventory::Models::SaleList,
          },
        })
      end
    end
  end
end
