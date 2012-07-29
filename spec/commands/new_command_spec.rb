require 'spec_helper'

describe Tlux::Commands::NewCommand do
  describe "#run" do
    before :each do
      FakeFS.activate!
    end

    after :each do
      FakeFS.deactivate!
    end

    context "tlux dir doesn't exist" do
      let(:new_command) { Tlux::Commands::NewCommand.new('foo') }

      it "should create the tlux dir" do
        new_command.run
        Dir.exists?('~/.tlux').should be_true
      end
    end
  end
end
