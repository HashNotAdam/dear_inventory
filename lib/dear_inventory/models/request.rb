# typed: strict
# frozen_string_literal: true

module DearInventory
  module Models
    class Request < DearInventory::Model
      extend T::Sig

      attr_reader :action
      attr_reader :model
      attr_reader :params
      attr_reader :uri 

      sig { params(parameters: T::Hash[Symbol, T.untyped]).void }
      def initialize(parameters)
        @action = parameters[:action]
        @model = parameters[:model]
        @params = parameters[:params]
        @uri = parameters[:uri]
      end
    end
  end
end
