require 'spec_helper'

describe Tlux::Pane do
  it_behaves_like Tlux::Splitable do
    let(:splitable) { Tlux::Pane.new(:vertical) }
  end

  it_behaves_like Tlux::Commandable do
    let(:commandable) { Tlux::Pane.new(:vertical) }
  end

  describe ".new" do
    subject { Tlux::Pane.new(:vertical) }

    it "should have an orientation" do
      subject.orientation.should == :vertical
    end
  end
end
