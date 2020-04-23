# typed: strong
# frozen_string_literal: true

module DearInventory
  module Helpers
    class Config
      extend T::Sig

      sig { void }
      def self.configure
        DearInventory.configure do |config|
          config.account_id = ENV["ACCOUNT_ID"]
          config.key = ENV["KEY"]
        end
      end
    end
  end
end
