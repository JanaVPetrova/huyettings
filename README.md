# Huyettings

[![Build Status](https://travis-ci.org/JanaVPetrova/huyettings.svg?branch=master)](https://travis-ci.org/JanaVPetrova/huyettings)

Supersimple configuration manager. Single level. Yaml. ERB. No more pain.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'huyettings'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install huyettings

## Usage

```
test:
  setting1: 'setting1'
  setting2: <%= 1 + 2 %>
```

```ruby
config = Huyettings.new('/path/to/settings.yml', :my_shiny_env)
config.setting1
config.setting2
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JanaVPetrova/huyettings.
