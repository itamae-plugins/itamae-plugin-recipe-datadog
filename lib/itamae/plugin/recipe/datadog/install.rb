node.reverse_merge!(
  datadog: {
    install_only: true,
    upgrade: false,
  }
)

execute 'download install script' do
  command 'wget https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh'
end

execute "change install script's permission" do
  command 'chmod 755 install_script.sh'
end

execute 'install datadog-agent' do
  options = {}
  options['DD_API_KEY'] = node[:datadog][:api_key]
  options['DD_INSTALL_ONLY'] = 'true' if node[:datadog][:install_only]
  options['DD_UPGRADE'] = 'true' if node[:datadog][:upgrade]
  option_str = options.map { |k, v| "#{k}=#{v}" }.joins(' ')
  command "#{option_str} ./install_script.sh"
end
