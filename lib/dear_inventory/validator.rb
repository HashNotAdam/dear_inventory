# typed: strict
# frozen_string_literal: true

module DearInventory
  class Validator
    extend T::Sig

    extend T::Helpers
    abstract!

    DEFAULT_OPTIONS = T.let(
      {
        limit: nil,
        max_length: nil,
        values: nil,
      }.freeze,
      T::Hash[Symbol, T.nilable(T.any(Integer, T::Array[String]))]
    )
    private_constant :DEFAULT_OPTIONS

    sig do
      params(
        field_name: Symbol,
        value: T.nilable(T.any(Date, Numeric, String, T::Boolean, Time)),
        options: T::Hash[Symbol, T.untyped]
      ).void
    end
    def self.call(field_name, value, options: DEFAULT_OPTIONS)
      new(field_name, value, options: options).call
    end

    sig do
      params(
        field_name: Symbol,
        value: T.nilable(T.any(Date, Numeric, String, T::Boolean, Time)),
        options: T::Hash[Symbol, T.untyped]
      ).void
    end
    def initialize(field_name, value, options: DEFAULT_OPTIONS)
      @field_name = T.let(field_name, Symbol)
      @value =
        T.let(value, T.nilable(T.any(Date, Numeric, String, T::Boolean, Time)))

      @limit = T.let(options[:limit], T.nilable(Integer))
      @max_length = T.let(options[:limit], T.nilable(Integer))
      @values = T.let(options[:values], T.nilable(T::Array[String]))
    end

    private

    sig { abstract.void }
    def call; end

    protected

    sig { params(message: String).void }
    def raise_error(message)
      raise ValidationError, "#{@field_name} is invalid, #{message}"
    end
  end
end
