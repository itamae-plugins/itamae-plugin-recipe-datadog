node.reverse_merge!(
  datadog: {
    install_only: true
  }
)

execute 'download install script' do
  command 'wget https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh'
end

execute "change install script's permission" do
  command 'chmod 755 install_agent.sh'
end

execute 'install datadog-agent' do
  if node[:datadog][:install_only]
    command "DD_API_KEY=#{node[:datadog][:api_key]} DD_INSTALL_ONLY=true ./install_agent.sh"
  else
    command "DD_API_KEY=#{node[:datadog][:api_key]} ./install_agent.sh"
  end
end
