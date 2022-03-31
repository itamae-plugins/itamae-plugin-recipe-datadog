case node[:platform]
when "debian", "ubuntu"
  execute "apt-get update"

when "amazon"
  # `groupadd` isn't installed in https://hub.docker.com/_/amazonlinux
  package "shadow-utils"
end

include_recipe "datadog::install"
