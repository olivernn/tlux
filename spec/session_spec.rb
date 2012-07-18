require 'spec_helper'

describe Tlux::Session do
  let(:session) { Tlux::Session.new }

  describe "#name" do
    it "should have a name" do
      session.name = "foo"
      session.name.should == "foo"
    end
  end

  describe "#window" do
    let(:name) { "bar" }
    let(:opts) { {:baz => true} }

    it "should create a new window" do
      Tlux::Window.should_receive(:new).with(name, opts)
      session.window name, opts
    end

    it "should add a window to the list of windows" do
      expect {
        session.window name, opts
      }.to change(session.windows, :size).by(1)
    end

    it "should yield the new window in the passed block" do
      window = nil

      session.window "foo" do
        window = self
      end

      window.should be_kind_of(Tlux::Window)
      window.name.should == "foo"
    end
  end
end
