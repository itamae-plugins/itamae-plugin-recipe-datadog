describe command("datadog-agent integration show datadog-puma") do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should contain("datadog-puma") }
  its(:stdout) { should contain("1.1.0") }
end

describe command("datadog-agent integration show datadog-vsphere") do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should be_empty }
  its(:stdout) { should contain("datadog-vsphere") }
end
