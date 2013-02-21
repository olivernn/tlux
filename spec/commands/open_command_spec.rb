require 'spec_helper'

describe Tlux::Commands::OpenCommand do
  describe "#run" do
    let(:config_name) { 'foo' }
    subject { Tlux::Commands::OpenCommand.new(config_name) }

    before :each do
      FakeFS.activate!
      FileUtils.mkdir_p(Tlux::TEMPLATES_PATH)
      FileUtils.touch(File.join(Tlux::TEMPLATES_PATH, 'new.erb'))
    end

    after :each do
      FakeFS::FileSystem.clear
      FakeFS.deactivate!
    end

    context "tlux dir doesn't exist" do
      it "should create the tlux dir" do
        subject.run(false)
        Dir.exists?(File.join(Dir.home, '.tlux')).should be_true
      end
    end

    it "should create the config file" do
      subject.run(false)
      File.exists?(File.join(Dir.home, '.tlux', config_name))
    end
  end
end
