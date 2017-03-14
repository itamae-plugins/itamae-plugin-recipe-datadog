template '/etc/yum.repos.d/datadog.repo' do
  source './templates/datadog.repo'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    archi: node.kernel.machine,
  )
end

package 'datadog-agent'
