describe package("datadog-agent") do
  it { should be_installed }
end

context "When datadog-agent is installed" do
  describe "installation is skipped", if: ENV["DATADOG_UPGRADE"] == "false" do
    describe file("/etc/datadog-agent/datadog.yaml") do
      it { should be_file }
      it { should exist }
      it { should contain "api_key: api_key_1" }
    end
  end

  describe "datadog-agent is upgraded", if: ENV["DATADOG_UPGRADE"] == "true" do
    describe file("/etc/datadog-agent/datadog.yaml") do
      it { should be_file }
      it { should exist }
      it { should contain "api_key: api_key_3" }
    end
  end
end
