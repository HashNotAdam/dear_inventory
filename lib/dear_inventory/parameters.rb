# typed: strict
# frozen_string_literal: true

module DearInventory
  class Parameters
    extend T::Sig
    extend DearInventory::IsASubclass

    sig { params(params: T::Hash[Symbol, T.untyped]).void }
    def initialize(params)
      @values = T.let({}, T::Hash[Symbol, T.untyped])
      assign_params(params)
    end

    class << self
      extend T::Sig

      sig do
        params(
          fields: T::Hash[
            Symbol, T::Hash[Symbol, T.any(Symbol, T::Array[String], T::Boolean)]
          ]
        ).void
      end
      def fields(fields)
        const_set(:FIELDS, fields.freeze)

        fields.each do |name, specifications|
          define_method_for_validator(name, specifications)
        end
      end

      sig do
        params(
          resource_class: T.untyped,
          endpoint: T.nilable(String),
          params: T::Hash[Symbol, T.untyped]
        ).returns(T.untyped)
      end
      def convert(resource_class, endpoint, params)
        resource = resource_class.name.split("::").last
        params_class = DearInventory::EndpointClass.(
          class_type: "Parameters",
          resource_class: resource_class,
          endpoint: endpoint
        )
        params_class = T.cast(
          params_class,
          T.class_of(DearInventory::Parameters)
        )

        convert_with_params_class(
          endpoint: endpoint, params_class: params_class,
          resource_class: resource_class, params: params
        )
      end

      private

      sig do
        params(
          name: Symbol,
          specifications: T::Hash[
            Symbol, T.any(Symbol, T::Array[String], T::Boolean)
          ]
        ).void
      end
      def define_method_for_validator(name, specifications)
        case specifications[:type]
        when :Enum
          define_enum_method(name, specifications)
        when :String
          define_string_method(
            name,
            T.cast(specifications, T::Hash[Symbol, T.any(Symbol, T::Boolean)])
          )
        else
          define_method_without_options(
            name,
            T.cast(specifications, T::Hash[Symbol, T.any(Symbol, T::Boolean)])
          )
        end
      end

      sig do
        params(
          name: Symbol,
          specifications: T::Hash[
            Symbol, T.any(Symbol, T::Array[String], T::Boolean)
          ]
        ).void
      end
      def define_enum_method(name, specifications)
        validator = DearInventory::Validators::Enum
        options = {
          values: specifications[:values]
        }
        define_method_with_options(name, validator, options)
      end

      sig do
        params(
          name: Symbol,
          specifications: T::Hash[Symbol, T.any(Symbol, T::Boolean)]
        ).void
      end
      def define_string_method(name, specifications)
        validator = DearInventory::Validators::String
        options = {
          max_length: specifications[:max_length]
        }
        define_method_with_options(name, validator, options)
      end

      sig do
        params(
          name: Symbol,
          validator: T.class_of(DearInventory::Validator),
          options: T::Hash[
            Symbol, T.nilable(T.any(Symbol, T::Array[String], T::Boolean))
          ],
        ).void
      end
      def define_method_with_options(name, validator, options)
        define_method("#{name}=") do |value|
          validator.(
            name,
            value,
            options: options
          )

          T.unsafe(self).instance_variable_get(:@values)[name] = value
        end
      end

      sig do
        params(
          name: Symbol,
          specifications: T::Hash[Symbol, T.any(Symbol, T::Boolean)]
        ).void
      end
      def define_method_without_options(name, specifications)
        validator = Object.const_get(
          "DearInventory::Validators::#{specifications[:type]}"
        )
        define_method("#{name}=") do |value|
          validator.(name, value)
          T.unsafe(self).instance_variable_get(:@values)[name] = value
        end
      end

      sig do
        params(
          params_class: T.nilable(T.class_of(DearInventory::Parameters)),
          resource_class: DearInventory::Resource,
          endpoint: T.nilable(String),
          params: T::Hash[Symbol, T.untyped]
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
          value = parameter_value(field_name, specifications)
          next if value.nil?

          hash[specifications[:property]] = value
        end
    end

    private

    sig do
      params(
        field_name: Symbol,
        specifications: T::Hash[Symbol, T.untyped]
      ).returns(T.nilable(T.any(String, Numeric, T::Boolean)))
    end
    def parameter_value(field_name, specifications)
      value = @values[field_name]
      Validators::Required.(field_name, value) if specifications[:required]

      if value.respond_to?(:strftime)
        ::DearInventory::DateTime.new(value).to_s
      else
        value
      end
    end

    sig { params(params: T::Hash[Symbol, T.untyped]).void }
    def assign_params(params)
      params.each do |name, value|
        public_send(:"#{name}=", value)
      end
    end
  end
end
