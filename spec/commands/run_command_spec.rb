#require 'spec_helper'
#
#describe Tlux::Commands::RunCommand do
#  describe "#run" do
#    before :each do
#      FakeFS.activate!
#    end
#
#    after :each do
#      FakeFS.deactivate!
#    end
#
#    let(:config_path) { File.join(Dir.home, '.tlux', 'test') }
#    let(:current_dir) { Dir.pwd }
#    let(:command) { Tlux::Commands::RunCommand.new(config_path, current_dir) }
#
#    context "config file does not exist" do
#      it "should raise a Tlux::Config::FileNotFoundError" do
#        expect {
#          command.run
#        }.to raise_error(Tlux::Config::FileNotFoundError)
#      end
#    end
#
#    context "config file does exist" do
#      before :each do
#        Tlux::Config::Parser.stub!(:new).with
#      end
#
#      describe "parsing the config file" do
#        it "should parse the config file" do
#          parser.should_receive(:parse!)
#        end
#      end
#
#      it "should generate the tmux config for the tlux config file" do
#
#      end
#
#      it "should write the file out to tlux directory" do
#
#      end
#    end
#  end
#end
