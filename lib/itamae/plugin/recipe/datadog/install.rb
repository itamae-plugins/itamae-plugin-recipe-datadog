node.reverse_merge!(
  datadog: {
    install_only: true,
    upgrade: false,
  }
)

execute 'download install script' do
  command 'wget https://raw.githubusercontent.com/DataDog/datadog-agent/main/cmd/agent/install_script.sh -O /tmp/install_script.sh'
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
  option_str = options.map { |k, v| "#{k}=#{v}" }.join(' ')
  command "#{option_str} /tmp/install_script.sh"
end
