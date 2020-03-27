# DearInventory

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dear_inventory`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem "dear_inventory"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dear_inventory

## N.B for Ruby 2.7

At time of writing, the Sorbet team has not yet accepted my pull request to fix
deprecation warnings due to the use of the single splat operator. It can be
quite frustrating to have your console flooded with warnings and so it may be
worth your while specifying my fork of sorbet-runtime in your project's Gemfile:
```
gem "sorbet-runtime",
    git: "https://github.com/HashNotAdam/sorbet.git",
    branch: "feature/ruby_2_7_keyword_arguments",
    glob: "gems/sorbet-runtime/sorbet-runtime.gemspec"
```

## Usage

Before you begin, you will need to setup API credentials in DEAR Inventory at
https://inventory.dearsystems.com/ExternalApi

Next you need to supply your API credentials:
```ruby
require "dear_inventory"

DearInventory.configure do |config|
  config.account_id = "account_id"
  config.key = "key"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

Since it is necessary to authenticate with DEAR Inventory to test API resources,
credentials are required. The dotenv gem is loaded when tests are run and will
look for a .env file in the root directory. A .env.example file has been
supplied so you copy it to .env and replace the example values:

```sh
cp .env.example .env
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HashNotAdam/dear_inventory. This project is intended to be a safe, welcoming
space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DearInventory project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/HashNotAdam/dear_inventory/blob/master/CODE_OF_CONDUCT.md).
