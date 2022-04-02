# Itamae::Plugin::Recipe::Datadog

[Itamae](https://github.com/itamae-kitchen/itamae) plugin to install Datadog Agent.

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-datadog.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-datadog)
[![test](https://github.com/itamae-plugins/itamae-plugin-recipe-datadog/actions/workflows/test.yml/badge.svg)](https://github.com/itamae-plugins/itamae-plugin-recipe-datadog/actions/workflows/test.yml)

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
```ruby
# In your recipe
include_recipe "datadog::install"
```

### Node
`$ itamae -y node.yml`

```yaml
# node.yml
datadog:
  api_key: xxxxxx
  install_only: false # default: true
  upgrade: true # default: false
  agent_major_version: 7 # default: none

  integrations: # default: {}
    datadog-puma: 1.1.0 # Install specified version (recommended)
    datadog-vsphere: # Install latest version
```

- `node[:datadog][:api_key]`
  - Your datadog-agent API Key.
- `node[:datadog][:install_only]`
  - An install option. If you want to install agent and don't start agent, please set this option`true`.
- `node[:datadog][:upgrade]`
  - An install option. Upgrade datadog-agent version automatically.
- `node[:datadog][:agent_major_version]`
  - Whether to install any major version of the agent. (e.g. `7`)
  - default is none. installed with datadog-agent v6
  - see https://docs.datadoghq.com/agent/versions/upgrade_to_agent_v7
- `node[:datadog][:integrations]`
  - Install integrations
  - see https://docs.datadoghq.com/agent/guide/integration-management/
  - key: integration name (e.g. `datadog-puma`)
  - value: integration version (e.g. `1.1.0`)

## Definitions
### install_datadog_agent_integration
Install datadog-agent integration

Usage

```ruby
include_recipe "datadog::install_datadog_agent_integration"

# Install specified version (recommended)
install_datadog_agent_integration "datadog-puma" do
  version "1.1.0"
end

# Install latest version
install_datadog_agent_integration "datadog-puma"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/itamae-plugins/itamae-plugin-recipe-datadog. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

