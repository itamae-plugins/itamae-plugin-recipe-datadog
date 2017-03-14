node.validate! do
  {
    datadog: {
      api_key: string,
    },
  }
end

template '/etc/dd-agent/datadog.conf' do
  source './templates/datadog.conf'
  owner  'dd-agent'
  group  'dd-agent'
  mode   '0640'
  variables(
    api_key: node.datadog.api_key,
  )
end
