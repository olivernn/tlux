require 'spec_helper'

describe Tlux::Window do
  it_behaves_like Tlux::Splitable do
    let(:splitable) { Tlux::Window.new("foo") }
  end

  it_behaves_like Tlux::Commandable do
    let(:commandable) { Tlux::Window.new("foo") }
  end

  describe ".new" do
    subject { Tlux::Window.new("foo") }

    it "should have a name" do
      subject.name.should == "foo"
    end
  end
end
