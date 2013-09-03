require 'spec_helper'

describe Tlux::Config::Parser do
  describe ".from_file" do
    context "config file doesn't exist" do
      it "should raise a Tlux::Config::FileNotFound" do
        expect {
          Tlux::Config::Parser.from_file(File.join('no', 'such', 'file'))
        }.to raise_error(Tlux::Config::FileNotFound)
      end
    end

    context "config file does exist" do
      it "should return a new instance of Tlux::Config::Parser" do
        parser = Tlux::Config::Parser.from_file(File.join('spec', 'fixtures', 'sample_config.rb'))
        parser.should be_kind_of(Tlux::Config::Parser)
      end
    end
  end

  describe "#initialize" do
    let(:config) { 'dummy config' }
    subject { Tlux::Config::Parser.new config }

    it "should have a config string" do
      subject.config.should == config
    end

    it "should have a new session object" do
      subject.session.should be_kind_of Tlux::Session
    end
  end

  describe "#parse!" do
    let!(:session) { Tlux::Session.new }
    let(:config) { 'dummy config' }
    subject { Tlux::Config::Parser.new config }

    before :each do
      Tlux::Session.stub(:new).and_return(session)
    end

    it "should instance eval the config with the new session" do
      session.should_receive(:instance_eval).with(config)
      subject.parse!
    end
  end
end
