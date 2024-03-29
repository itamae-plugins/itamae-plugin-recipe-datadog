include_recipe "datadog::install_datadog_agent_integration"

node.reverse_merge!(
  datadog: {
    install_only: true,
    upgrade: false,
    integration: {},
  }
)

package 'wget'

execute 'download install script' do
  command 'wget https://raw.githubusercontent.com/DataDog/datadog-agent/main/cmd/agent/install_script.sh -O /tmp/install_script.sh'

  # If upgrade is enabled, always download the latest install_script.sh
  # If upgrade is disabled, download only when `/tmp/install_script.sh` doesn't exist
  unless node[:datadog][:upgrade]
    not_if 'ls /tmp/install_script.sh'
  end
end

file '/tmp/install_script.sh' do
  action :edit
  mode '0755'
end

execute 'install datadog-agent' do
  options = {}
  options['DD_API_KEY'] = node[:datadog][:api_key]
  options['DD_INSTALL_ONLY'] = 'true' if node[:datadog][:install_only]
  options['DD_UPGRADE'] = 'true' if node[:datadog][:upgrade]
  options['DD_AGENT_MAJOR_VERSION'] = node[:datadog][:agent_major_version] if node[:datadog][:agent_major_version]
  option_str = options.map { |k, v| "#{k}=#{v}" }.join(' ')
  command "#{option_str} /tmp/install_script.sh"

  # If upgrade is enabled, always run `install_script.sh`
  # If upgrade is disabled, run `install_script.sh` only when datadog isn't installed
  unless node[:datadog][:upgrade]
    not_if 'ls /etc/datadog-agent/datadog.yaml'
  end
end

node[:datadog][:integrations].each do |integration_name, integration_version|
  install_datadog_agent_integration integration_name do
    version integration_version
  end
end
