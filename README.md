# PortkeyParallaxHeader

This category makes it super easy to add a parallax header view to your scroll views.

## Demo


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'portkey_parallax_header'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install portkey_parallax_header

## API

```ruby
# @param [UIView] view, the view being added
# @param [Float] height, the height of the parallax header
add_portkey_parallax_with_view(view, height: height)

# @param [UIView] view, the view being added
# @param [Float] height, the height of the parallax header
# @param [Boolean] shadow, whether to show a shadow along the bottom or not
add_portkey_parallax_with_view(view, height: height, shadow: shadow)

# @param [UIView] view, the view being added
# @param [Float] height, the height of the parallax header
# @param [Float] min_height, the minimum height of the header when scrolling up
# @param [Boolean] shadow, whether to show a shadow along the bottom or not
add_portkey_parallax_with_view(view, height: height, shadow: shadow, min_height: min_height)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sight-labs/portkey_parallax_header. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

