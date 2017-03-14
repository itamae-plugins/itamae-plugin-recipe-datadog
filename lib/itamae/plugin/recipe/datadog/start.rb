unless node[:datadog][:install_only]
  service 'datadog-agent' do
    action %i(start enable)
  end
end
