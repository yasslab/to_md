# ToMd
[![Build Status](https://travis-ci.org/yasslab/to_md.svg)](https://travis-ci.org/yasslab/to_md)
[![Code Climate](https://codeclimate.com/github/yasslab/to_md/badges/gpa.svg)](https://codeclimate.com/github/yasslab/to_md)
[![Test Coverage](https://codeclimate.com/github/yasslab/to_md/badges/coverage.svg)](https://codeclimate.com/github/yasslab/to_md/coverage)

Convert Ruby Object to markdown by `#to_md` method.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_md'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_md

## Usage

```rb
require 'to_md'

using ToMd

puts ['one', 'two'].to_md
# - one
# - two

puts [['#', 'japanese'], [1, '一']].to_md
# | # | japanese |
# | --- | --- |
# | 1 | 一 |
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/to_md. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
