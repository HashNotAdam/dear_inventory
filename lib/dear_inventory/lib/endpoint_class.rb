# typed: strict
# frozen_string_literal: true

module DearInventory
  class EndpointClass
    extend T::Sig

    sig do
      params(
        class_type: String,
        resource_class: T.class_of(DearInventory::Resource),
        endpoint: T.nilable(String)
      ).returns(
        T.nilable(
          T.any(
            T.class_of(DearInventory::Parameters),
            T.class_of(DearInventory::Response)
          )
        )
      )
    end
    def self.call(class_type:, resource_class:, endpoint:)
      new(
        class_type: class_type,
        resource_class: resource_class,
        endpoint: endpoint
      ).call
    end

    sig do
      params(
        class_type: String,
        resource_class: T.class_of(DearInventory::Resource),
        endpoint: T.nilable(String)
      ).void
    end
    def initialize(class_type:, resource_class:, endpoint:)
      @class_type = T.let(class_type, String)
      @resource_class = T.let(resource_class, T.untyped)
      @endpoint = T.let(endpoint || "Index", String)
      @class_name = T.let(nil, T.nilable(String))
    end

    sig do
      returns(
        T.nilable(
          T.any(
            T.class_of(DearInventory::Parameters),
            T.class_of(DearInventory::Response)
          )
        )
      )
    end
    def call
      Object.const_get(class_name) if Object.const_defined?(class_name)
    end

    private

    sig { returns(String) }
    def class_name
      @class_name ||= begin
        name = ["DearInventory"]
        name << @class_type
        name << @resource_class.name.split("::").last
        name << @endpoint
        name.join("::")
      end
    end
  end
end
