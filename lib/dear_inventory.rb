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
require "dear_inventory/models/sale_list"

require "dear_inventory/validator"
require "dear_inventory/validators/boolean"
require "dear_inventory/validators/enum"
require "dear_inventory/validators/integer"
require "dear_inventory/validators/required"
require "dear_inventory/validators/string"
require "dear_inventory/validators/time"

require "dear_inventory/parameters"
require "dear_inventory/parameters/sale_list/index"

require "dear_inventory/resource"
require "dear_inventory/resources/sale_list"

require "dear_inventory/response"
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
