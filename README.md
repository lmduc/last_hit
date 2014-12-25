# LastHit

Help you to run relevant tests

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'last_hit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install last_hit

## Usage

- Run current modified tests (before commiting)

```ruby
bundle exec rake last_hit:current_modified
```

- Run all changed tests of a branch from its fork with another branch

```ruby
bundle exec rake last_hit:current_branch
```

- How to config LastHit: put these lines into /config/initializers/last_hit.rb

```ruby
LastHit::Configure.config do |config|
  config.test_command = "bundle exec rspec"
  config.default_base_branch = "development"
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/last_hit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
