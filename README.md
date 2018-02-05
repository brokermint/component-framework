# Component::Framework

The minimalistic framework for developing Rails component based applications.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'component-framework'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install component-framework

## Usage


Add the following lines to application.rb after your application class declaration.

_application.rb_
```ruby
module My
  class Application < Rails::Application
    ...
  end

  Component::Framework.initialize(YourApplication)
```

### Conventions


### Assets


### Folder Structure

/components/
    <name>/
        assets/
            images/
            javascripts/
            stylesheets/
        api/


### Components Initialization


### Routing


### DB Migrations


### Gemfile

It's recommended to use `group :component_name` for gems required by particular component.


### Settings

```ruby  
settings = Component::Settings.load_settings(:settings)
config.settings = settings
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/component-framework. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
