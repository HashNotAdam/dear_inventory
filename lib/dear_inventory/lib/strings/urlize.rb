# typed: strict
# frozen_string_literal: true

module Strings
  class Urlize
    extend T::Sig

    sig { params(camel_cased_word: String).returns(String) }
    def self.call(camel_cased_word)
      return camel_cased_word unless /[A-Z_]/.match?(camel_cased_word)

      camel_cased_word.
        gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1-\2').
        gsub(/([a-z\d])([A-Z])/, '\1-\2').
        downcase
    end
  end
end
