# LastHit

You finish your features, push code to test servers and they fails after centuries wating? This gem will reduce your waiting time by running only relevant tests in your current branch before pushing. Then you can fix failed tests right before pushing them to the test server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'last_hit', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install last_hit

## Config

Run the command `last_hit init` to generate the config file for the gem. By default, the config file is `./last_hit.yml`. You can set the path to the config file by attaching `-p [path]` to the command. For more information, please run `last_hit --help`.

## Usage

#### Run the current modified tests (before commiting)

```ruby
last_hit modified_tests

#=> Run files: spec/file_filter/spec_spec.rb

#=> .

#=> Finished in 0.00105 seconds (files took 0.04047 seconds to load)
#=> 1 examples, 0 failures
```

#### Run all modified tests of your current branch compared to the base branch

Options for command:
* `-b [base_branch]` specify the base branch, optional.
* `-C [config_file_path]` specify the file path of the config, optional, default is `~/last_hit.yml`.

```ruby
last_hit all_tests -b develop

#=> Run files: spec/file_filter/spec_spec.rb spec/rc_adapter/git_spec.rb

#=> ...

#=> Finished in 0.00305 seconds (files took 0.14047 seconds to load)
#=> 3 examples, 0 failures
```

`develop` is your base branch

## Contributing

1. Fork it ( https://github.com/[my-github-username]/last_hit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
