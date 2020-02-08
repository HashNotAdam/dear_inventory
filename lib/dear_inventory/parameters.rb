# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    extend T::Sig
    extend DearInventory::IsASubclass

    sig { params(params: T::Hash[Symbol, T.untyped]).void }
    def initialize(params)
      @values = {}
      assign_params(params)
    end

    class << self
      extend T::Sig

      sig do
        params(
          fields: T::Hash[Symbol, T::Hash[Symbol, T.any(Symbol, T::Boolean)]]
        ).void
      end
      def fields(fields)
        const_set(:FIELDS, fields.freeze)

        fields.each do |name, specifications|
          validator = Object.const_get(
            "DearInventory::Validators::#{specifications[:type]}"
          )

          define_method("#{name}=") do |value|
            validator.(name, value, limit: specifications[:limit])
            @values[name] = value
          end
        end
      end

      sig do
        params(
          resource_class: T.untyped,
          endpoint: T.nilable(String),
          params: T.nilable(T::Hash[Symbol, T.untyped])
        ).returns(T.untyped)
      end
      def convert(resource_class, endpoint, params)
        resource = resource_class.name.split("::").last
        params_class = DearInventory::EndpointClass.(
          class_type: "Parameters",
          resource_class: resource_class,
          endpoint: endpoint
        )
        params_class

        convert_with_params_class(
          endpoint: endpoint, params_class: params_class,
          resource_class: resource_class, params: params
        )
      end

      private

      sig do
        params(
          params_class: T.nilable(DearInventory::Parameters),
          resource_class: DearInventory::Resource,
          endpoint: T.nilable(String),
          params: T.nilable(T::Hash[Symbol, T.untyped])
        ).returns(T.nilable(DearInventory::Parameters))
      end
      def convert_with_params_class(
        params_class:, resource_class:, endpoint:, params:
      )
        return params_class.new(params) unless params_class.nil?

        message = "No parameters class can be found for resource, " \
          "#{resource_class}, with endpoint #{endpoint}"
        raise ArgumentError, message
      end
    end

    sig { returns(T::Hash[Symbol, T.untyped]) }
    def to_h
      self.class.
        const_get(:FIELDS).
        each_with_object({}) do |(field_name, specifications), hash|
          value = @values[field_name]

          if specifications[:required]
            Validators::Required.(field_name, value, limit: limit)
          end

          next if value.nil?

          value = value.strftime("%FT%T.%3N") if value.respond_to?(:strftime)
          hash[specifications[:property]] = value
        end
    end

    private

    sig { params(params: T::Hash[Symbol, T.untyped]).void }
    def assign_params(params)
      params.each do |name, value|
        __send__(:"#{name}=", value)
      end
    end
  end
end
