# Charty::Backends::Jfreechart

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/charty/backends/jfreechart`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'charty-backends-jfreechart'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install charty-backends-jfreechart

## Usage

see also https://github.com/red-data-tools/charty#examples

```ruby
require "charty-backends-jfreechart"
charty = Charty::Plotter.new(:jfreechart)

bar = charty.bar do
  series [0,1,2,3,4], [10,40,20,90,70], label: "sample1"
  series [0,1,2,3,4], [90,80,70,60,50], label: "sample2"
  series [0,1,2,3,4,5,6,7,8], [50,60,20,30,10, 90, 0, 100, 50], label: "sample3"
  range x: 0..10, y: 1..100
  xlabel 'foo'
  ylabel 'bar'
  title 'bar plot'
end
bar.render("sample_images/bar_jfreechart.png")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/284km/charty-backends-jfreechart. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Charty::Backends::Jfreechart project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/284km/charty-backends-jfreechart/blob/master/CODE_OF_CONDUCT.md).
