# DearInventory

A Ruby API client for connecting to DEAR Inventory. At this point, I have only been implementing the GET requests based upon our business needs but, if you like the look of this gem but require a missing endpoint, it would be quite easy to bolt on POST/PUT/Delete endpoints.

Honestly, the DEAR API is a mess. Where possible, this gem attempts to hide the rampant inconsistencies and provide continuity but I'm afraid I'm no magician.

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

At time of writing, the Sorbet team has not yet accepted my pull request to fix deprecation warnings due to the use of the single splat operator. It can be quite frustrating to have your console flooded with warnings and so it may be worth your while specifying my fork of sorbet-runtime in your project's Gemfile:
```
gem "sorbet-runtime",
    git: "https://github.com/HashNotAdam/sorbet.git",
    branch: "feature/ruby_2_7_keyword_arguments",
    glob: "gems/sorbet-runtime/sorbet-runtime.gemspec"
```

## Configuration

Before you begin, you will need to setup API credentials in DEAR Inventory at https://inventory.dearsystems.com/ExternalApi

Next you need to supply your API credentials:
```ruby
require "dear_inventory"

DearInventory.configure do |config|
  config.account_id = "account_id"
  config.key = "key"
end
```

There is a default logger set to write to STDOUT which is also configurable

```ruby
DearInventory.configure do |config|
  ...
  config.logger = CustomLogger.new
end
```

## Endpoints

- [Customer](https://github.com/HashNotAdam/dear_inventory-ruby/blob/master/docs/resources/customer.md)
- [Product](https://github.com/HashNotAdam/dear_inventory-ruby/blob/master/docs/resources/product.md)
- [Product Availability](https://github.com/HashNotAdam/dear_inventory-ruby/blob/master/docs/resources/product_availability.md)
- [Purchase](https://github.com/HashNotAdam/dear_inventory-ruby/blob/master/docs/resources/purchase.md)
- [Advanced Purchase](https://github.com/HashNotAdam/dear_inventory-ruby/blob/master/docs/resources/advanced_purchase.md)
- [Sale](https://github.com/HashNotAdam/dear_inventory-ruby/blob/master/docs/resources/sale.md)

## Managing pagination

The response object for any endpoint that returns a paginated result set will include helper methods for retrieving the results.

### each

`each` iterates over all the records as if they were not paginated, automatically retrieving subsequent pages.

```ruby
DearInventory::Customer.().each do |record|
	do_some_things(record)
end
```

### next_page

If you would like control over the pagination process, the paginated responses include a `next_page` method

```ruby
response = DearInventory::Customer.()

loop do
  do_some_things(response)
  break unless response.next_page?
  response = response.next_page
end
```

## Exceptions

Exceptions that occur while making a request to DEAR Inventory should be a subclass of DearInventory::RequestError. These errors include the DearInventory::Response instance which provides some flexibility in your error reporting.

```ruby
def find_a_sale
  DearInventory::Sale.(id: "incorrect")
rescue DearInventory::RequestError => e
  message = [
    e.message,
    "URI: #{e.response.request.uri}",
    "Params: #{e.response.request.params.to_h}"
  ]
  ErrorMonitoring.error(message.join("\n"))
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Since it is necessary to authenticate with DEAR Inventory to test API resources, credentials are required. The dotenv gem is loaded when tests are run and will look for a .env file in the root directory. A .env.example file has been supplied so you copy it to .env and replace the example values:

```sh
cp .env.example .env
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HashNotAdam/dear_inventory. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DearInventory project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/HashNotAdam/dear_inventory/blob/master/CODE_OF_CONDUCT.md).
