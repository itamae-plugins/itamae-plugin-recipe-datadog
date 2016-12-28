# Itamae::Plugin::Recipe::Datadog

[Itamae](https://github.com/ryotarai/itamae) plugin to install Datadog Agent.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-datadog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-datadog

## Usage

### Recipe
```
# In your recipe
include_recipe "datadog::install"
```

### Node
`$ itamae -y node.yml`

```
# node.yml
datadog:
  api_key: xxxxxx
  install_only: false # default: true
```

`node[:datadog][:api_key]` is your datadog-agent API Key.
`node[:datadog][:install_only]` is an install option. If you want to install agent and don't start agent, please set this option `true`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/itamae-plugin-recipe-datadog. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

