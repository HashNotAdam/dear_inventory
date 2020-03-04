# typed: strong
# frozen_string_literal: true

require "http"
require "sorbet-runtime"

require "dear_inventory/config"
require "dear_inventory/environment"

require "dear_inventory/error"
require "dear_inventory/errors/request"
require "dear_inventory/errors/validation"

require "dear_inventory/lib/endpoint_class"
require "dear_inventory/lib/is_a_subclass"

require "dear_inventory/model"
require "dear_inventory/models/additional_attributes"
require "dear_inventory/models/additional_charge"
require "dear_inventory/models/address"
require "dear_inventory/models/attachment"
require "dear_inventory/models/inventory_movement"
require "dear_inventory/models/sale_list"
require "dear_inventory/models/sales/line"
require "dear_inventory/models/sales/invoice_line"
require "dear_inventory/models/sales/manual_journal_line"
require "dear_inventory/models/sales/manual_journal"
require "dear_inventory/models/sales/order"
require "dear_inventory/models/sales/payment_line"
require "dear_inventory/models/sales/quote"
require "dear_inventory/models/shipping_address"
require "dear_inventory/models/transaction"
require "dear_inventory/models/sales/fulfilments/pick_pack_line"
require "dear_inventory/models/sales/fulfilments/pick_pack"
require "dear_inventory/models/sales/fulfilments/ship_line"
require "dear_inventory/models/sales/fulfilments/ship"
require "dear_inventory/models/sales/fulfilment"
require "dear_inventory/models/sales/credit_note"
require "dear_inventory/models/sales/invoice"

require "dear_inventory/validator"
require "dear_inventory/validators/boolean"
require "dear_inventory/validators/enum"
require "dear_inventory/validators/integer"
require "dear_inventory/validators/required"
require "dear_inventory/validators/string"
require "dear_inventory/validators/time"

require "dear_inventory/parameters"
require "dear_inventory/parameters/sale/index"
require "dear_inventory/parameters/sale_list/index"

require "dear_inventory/resource"
require "dear_inventory/resources/sale"
require "dear_inventory/resources/sale_list"

require "dear_inventory/response"
require "dear_inventory/responses/sale/index"
require "dear_inventory/responses/sale_list/index"

require "dear_inventory/version"

module DearInventory
  extend T::Sig

  @config = T.let(Config.new, Config)

  class << self
    extend T::Sig

    sig { returns(Config) }
    attr_reader :config

    sig { params(block: T.proc.params(config: Config).void).void }
    def configure(&block)
      yield config
    end
  end
end
