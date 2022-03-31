describe package("datadog-agent") do
  it { should be_installed }
end

describe service("datadog-agent") do
  it { should be_enabled }
  it { should be_installed }
end
