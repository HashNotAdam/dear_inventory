# typed: strict
# frozen_string_literal: true

module DearInventory
  module Models
    class Request < DearInventory::Model
      extend T::Sig

      sig { returns(Symbol) }
      attr_reader :action
      sig { returns(T.class_of(DearInventory::Model)) }
      attr_reader :model
      sig { returns(DearInventory::Parameters) }
      attr_reader :params
      sig { returns(String) }
      attr_reader :uri

      sig { params(parameters: T::Hash[Symbol, T.untyped]).void }
      def initialize(parameters)
        @action = T.let(parameters[:action], Symbol)
        @model = T.let(parameters[:model], T.class_of(DearInventory::Model))
        @params = T.let(parameters[:params], DearInventory::Parameters)
        @uri = T.let(parameters[:uri], String)
      end
    end
  end
end
