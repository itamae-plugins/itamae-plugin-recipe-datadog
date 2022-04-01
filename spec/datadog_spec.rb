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

context "When DD_AGENT_MAJOR_VERSION is specified" do
  context "DD_AGENT_MAJOR_VERSION is 7", if: ENV["DD_AGENT_MAJOR_VERSION"] == "7" do
    describe package("datadog-agent") do
      it "installed with v7" do
        version = subject.version.version
        expect(version).to match /^7\./
      end
    end
  end
end
