require 'spec_helper'

describe Tlux::Config::Generator do
  describe "#initialize" do
    let(:session) { Tlux::Session.new }
    subject { Tlux::Config::Generator.new(session) }

    it "should have a session" do
      expect(subject.session).to eq session
    end
  end

#  describe "generate!" do
#    let(:session) { Tlux::Session.new }
#    let(:template) { :template }
#    subject { Tlux::Config::Generator.new(session) }
#
#    it "should render the config template using the session" do
#      ERB.should_receive(:new).and_return(template)
#      template.should_receive(:run).with(session.get_binding)
#      subject.generate!
#    end
#  end
end
