# Camo

Ruby client for [Camo](https://github.com/atmos/camo)

## Get Started

**Note:** If you have not set up the camo server, start with [Deploying to Heroku](#deploying-to-heroku).

Add this line to your application’s Gemfile:

```ruby
gem "camo"
```

Add your camo host and key to your environment or create an initializer `config/initializers/camo.rb`.

```ruby
ENV["CAMO_HOST"] = "https://camo.herokuapp.com"
ENV["CAMO_KEY"] = "rzsJbU5YxDfdP3FXHjshtgEN"
```

You can now use the `camo` method in your views and controllers.

```erb
<%= image_tag camo("http://placekitten.com/g/200/300") %>
```

It’s that easy!

## Deploying to Heroku

Clone the camo repository.

```sh
git clone https://github.com/atmos/camo.git
cd camo
```

Create a new project on [Heroku](https://www.heroku.com/).

```sh
heroku create camo
```

Choose a [random secret key](https://www.random.org/passwords/?num=20&len=24&format=html&rnd=new) and add it to your app.

```sh
heroku config:set CAMO_KEY=rzsJbU5YxDfdP3FXHjshtgEN
```

Open your app to make sure it’s working. You should see the text “hwhat”.

```sh
heroku open
```

## Credit

Thanks to [Corey Donohoe](https://github.com/atmos) for creating camo and providing most of the Ruby code for this gem.

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/camo/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/camo/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
