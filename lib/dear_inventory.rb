# typed: strong
# frozen_string_literal: true

require "http"
require "sorbet-runtime"

require "dear_inventory/config"
require "dear_inventory/environment"

require "dear_inventory/version"

module DearInventory
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
