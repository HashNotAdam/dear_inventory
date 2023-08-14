# typed: strict
# frozen_string_literal: true

module DearInventory
  class DateTime
    extend T::Sig

    sig { params(date: T.any(Date, Time)).void }
    def initialize(date)
      @date = T.let(date, T.any(Date, Time))
    end

    sig { returns(String) }
    def to_s
      @date.strftime("%FT%T")
    end
  end
end
