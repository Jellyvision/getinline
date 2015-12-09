# Getinline

Inlines CSS styles for HTML email development and preserves ERB tags.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'getinline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install getinline

## Usage

`getinline` can be invoked in any of the following ways:

```shell
getinline file_name
getinline < file_name
cat file_name | getinline
```

Output is printed to stdout.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jellyvision/getinline.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
