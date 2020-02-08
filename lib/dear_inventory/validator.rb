# typed: strong
# frozen_string_literal: true

module DearInventory
  class Validator
    extend T::Sig

    extend T::Helpers
    abstract!

    sig do
      params(
        field_name: Symbol,
        value: T.nilable(T.any(Date, String, T::Boolean, Time)),
        limit: T.nilable(Integer)
      ).void
    end
    def self.call(field_name, value, limit: nil)
      return new(field_name, value).call if limit.nil?

      new(field_name, value, limit: limit).call
    end

    sig do
      params(
        field_name: Symbol,
        value: T.nilable(T.any(Date, String, T::Boolean, Time)),
        limit: T.nilable(Integer)
      ).void
    end
    def initialize(field_name, value, limit: nil)
      @field_name = T.let(field_name, Symbol)
      @limit = T.let(limit, T.nilable(Integer))
      @value = T.let(value, T.nilable(T.any(Date, String, T::Boolean, Time)))
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
