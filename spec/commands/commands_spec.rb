require 'spec_helper'

describe Tlux::Commands do
  describe ".run" do
    let(:command) { double(Tlux::Commands::RunCommand, run: true) }
    let(:args) { [1,2,3] }

    before do
      Tlux::Commands::RunCommand.stub!(:new).and_return(command)
    end

    context "with an available command" do
      it "should instantiate a command and run it" do
        command.should_receive(:run)
        Tlux::Commands::RunCommand.should_receive(:new).with(*args)
        Tlux::Commands.run('run', args)
      end
    end

    context "with an unavailable command" do
      it "should raise a CommandNotFoundError" do
        expect {
          Tlux::Commands.run('foo')
        }.to raise_error(Tlux::CommandNotFoundError)
      end
    end
  end
end
