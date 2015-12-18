# Getinline

A CSS inliner for Ruby ERB templates.

The motivation for this project is automating the premailer inliner and plain text generator such that ERB template variables are respected.

## Installation

Install the Getinline gem from [RubyGems](https://rubygems.org/gems/getinline):

    $ gem install getinline

or add it to your `Gemfile` and run `bundle`.

## Examples

#### Command Line

`getinline` can be invoked in any of the following ways on the command line:

```shell
getinline ./public/index.erb --mode txt
getinline < ./public/index.erb
cat ./public/index.erb | getinline
```

#### Rake Task

```ruby
require 'getinline'

namespace :generate do
  desc 'Generate inlined and plain text email templates'
  task emails: :environment do

    file = File.read('./public/index.erb')

    html_transformer = Getinline::Transformer.new(file)
    html_template = html_transformer.transform

    text_transformer = Getinline::Transformer.new(file, mode: :txt)
    text_template = text_transformer.transform

    File.write('./public/inline/index.erb', html_template)
    File.write('./public/text/index.erb', text_template)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jellyvision/getinline.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).