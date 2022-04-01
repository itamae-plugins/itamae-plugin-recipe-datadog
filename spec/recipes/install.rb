if ENV["DATADOG_UPGRADE"]
  node[:datadog][:upgrade] = ENV["DATADOG_UPGRADE"] == "true"
end

if ENV["DD_API_KEY"]
  node[:datadog][:api_key] = ENV["DD_API_KEY"]
end

if ENV["DD_AGENT_MAJOR_VERSION"]
  node[:datadog][:agent_major_version] = ENV["DD_AGENT_MAJOR_VERSION"].to_i
end

case node[:platform]
when "debian", "ubuntu"
  execute "apt-get update"

when "amazon"
  # `groupadd` isn't installed in https://hub.docker.com/_/amazonlinux
  package "shadow-utils"
end

include_recipe "datadog::install"
