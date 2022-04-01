define :install_datadog_agent_integration, version: nil do
  version = params[:version]
  name = params[:name]

  if version
    execute "datadog-agent integration install -t #{name}==#{version} --allow-root" do
      not_if "datadog-agent integration show #{name} | grep #{version}"
    end
  else
    execute "datadog-agent integration install -t #{name} --allow-root" do
      not_if "datadog-agent integration show #{name}"
    end
  end
end
