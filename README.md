# Camo Ruby

Ruby client for [Camo](https://github.com/atmos/camo) and [Go-Camo](https://github.com/cactus/go-camo) - the SSL image proxy :lock:

[![Build Status](https://github.com/ankane/camo-ruby/actions/workflows/build.yml/badge.svg)](https://github.com/ankane/camo-ruby/actions)

## Installation

Add this line to your application’s Gemfile:

```ruby
gem "camo"
```

## Getting Started

Add your Camo host and key to your environment or create an initializer `config/initializers/camo.rb`.

```ruby
ENV["CAMO_HOST"] = "https://camo.herokuapp.com"
ENV["CAMO_KEY"] = "rzsJbU5YxDfdP3FXHjshtgEN"
```

You can now use the `camo` method in your views and controllers.

```erb
<%= image_tag camo("https://placekitten.com/g/200/300") %>
```

## Credit

Thanks to [Corey Donohoe](https://github.com/atmos) for creating Camo and providing most of the Ruby code for this gem.

## History

View the [changelog](CHANGELOG.md)

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/camo-ruby/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/camo-ruby/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development:

```sh
git clone https://github.com/ankane/camo-ruby.git
cd camo-ruby
bundle install
go-camo -k 461fbf74af826c3a1020
bundle exec rake test
```
