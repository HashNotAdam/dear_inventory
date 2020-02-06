# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dear_inventory/version"

Gem::Specification.new do |spec|
  spec.name = "dear_inventory"
  spec.version = DearInventory::VERSION
  spec.authors = ["Adam Rice"]
  spec.email = ["development@hashnotadam.com"]

  spec.summary = "Library for connecting to the DEAR Inventory API"
  spec.description = "Works with V2 of the DEAR Systems / DEAR Inventory " \
                     "API as seen at https://dearinventory.docs.apiary.io/"
  spec.homepage = "https://morningcoffee.com.au"
  spec.license = "MIT"

  spec.required_ruby_version = ">= 2.5.0"
  spec.required_rubygems_version = ">= 1.8.11"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.
      split("\x0").
      reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", ">= 4.0.0", "< 5.0"
  spec.add_dependency "sorbet-runtime"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.71"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "sorbet"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
