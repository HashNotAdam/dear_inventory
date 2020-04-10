# typed: strong
# frozen_string_literal: true

require "http"
require "sorbet-runtime"

require "dear_inventory/config"
require "dear_inventory/environment"

require "dear_inventory/error"
require "dear_inventory/errors/not_paginated"
require "dear_inventory/errors/validation"

require "dear_inventory/errors/request"
require "dear_inventory/errors/bad_request"

require "dear_inventory/lib/endpoint_class"
require "dear_inventory/lib/date_time"
require "dear_inventory/lib/is_a_subclass"
require "dear_inventory/lib/request"

require "dear_inventory/model"
require "dear_inventory/models/additional_attributes"
require "dear_inventory/models/address"
require "dear_inventory/models/attachment"
require "dear_inventory/models/bill_of_materials_product"
require "dear_inventory/models/bill_of_materials_service"
require "dear_inventory/models/customers/address"
require "dear_inventory/models/customers/contact"
require "dear_inventory/models/inventory_movement"
require "dear_inventory/models/products/movement"
require "dear_inventory/models/purchase_list"
require "dear_inventory/models/purchase_lists"
require "dear_inventory/models/purchases/additional_charge"
require "dear_inventory/models/purchases/inventory_movement"
require "dear_inventory/models/purchases/invoice_additional_charge"
require "dear_inventory/models/purchases/line"
require "dear_inventory/models/purchases/invoice_line"
require "dear_inventory/models/purchases/manual_journal_line"
require "dear_inventory/models/purchases/manual_journal"
require "dear_inventory/models/purchases/stock_line"
require "dear_inventory/models/purchases/stock"
require "dear_inventory/models/purchases/unstock_line"
require "dear_inventory/models/reorder_level"
require "dear_inventory/models/sale_list"
require "dear_inventory/models/sales/additional_charge"
require "dear_inventory/models/sales/invoice_additional_charge"
require "dear_inventory/models/sales/line"
require "dear_inventory/models/sales/invoice_line"
require "dear_inventory/models/sales/manual_journal_line"
require "dear_inventory/models/sales/manual_journal"
require "dear_inventory/models/sales/order"
require "dear_inventory/models/sales/payment_line"
require "dear_inventory/models/sales/quote"
require "dear_inventory/models/shipping_address"
require "dear_inventory/models/supplier"
require "dear_inventory/models/transaction"
require "dear_inventory/models/sales/fulfilments/pick_pack_line"
require "dear_inventory/models/sales/fulfilments/pick_pack"
require "dear_inventory/models/sales/fulfilments/ship_line"
require "dear_inventory/models/sales/fulfilments/ship"
require "dear_inventory/models/sales/fulfilment"
require "dear_inventory/models/sale_lists"

require "dear_inventory/models/customer"
require "dear_inventory/models/customers"
require "dear_inventory/models/product"
require "dear_inventory/models/products"
require "dear_inventory/models/purchases/credit_note"
require "dear_inventory/models/purchases/invoice"
require "dear_inventory/models/purchases/order"
require "dear_inventory/models/purchase"
require "dear_inventory/models/sales/credit_note"
require "dear_inventory/models/sales/invoice"
require "dear_inventory/models/sale"
require "dear_inventory/models/request"

require "dear_inventory/validator"
require "dear_inventory/validators/boolean"
require "dear_inventory/validators/enum"
require "dear_inventory/validators/guid"
require "dear_inventory/validators/integer"
require "dear_inventory/validators/required"
require "dear_inventory/validators/string"
require "dear_inventory/validators/time"

require "dear_inventory/parameters"
require "dear_inventory/parameters/customer/index"
require "dear_inventory/parameters/product/index"
require "dear_inventory/parameters/purchase/index"
require "dear_inventory/parameters/purchase_list/index"
require "dear_inventory/parameters/sale/index"
require "dear_inventory/parameters/sale_list/index"

require "dear_inventory/resource"
require "dear_inventory/resources/customer"
require "dear_inventory/resources/product"
require "dear_inventory/resources/purchase"
require "dear_inventory/resources/purchase_list"
require "dear_inventory/resources/sale"
require "dear_inventory/resources/sale_list"

require "dear_inventory/response"

require "dear_inventory/version"

module DearInventory
  extend T::Sig

  @config = T.let(Config.new, Config)

  class << self
    extend T::Sig

    sig { returns(Config) }
    attr_reader :config

    # rubocop:disable Lint/UnusedMethodArgument
    sig { params(block: T.proc.params(config: Config).void).void }
    def configure(&block)
      yield config
    end
    # rubocop:enable Lint/UnusedMethodArgument
  end
end
