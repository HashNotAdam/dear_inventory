# typed: strict
# frozen_string_literal: true

module DearInventory
  class NotPaginatedError < Error
    extend T::Sig

    sig do
      params(
        message: T.nilable(String),
        uri: String
      ).void
    end
    def initialize(message = nil, uri:)
      message ||= "The endpoint (#{uri}) is not paginated"
      super(message)
    end
  end
end
