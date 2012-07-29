require 'spec_helper'

describe Tlux::Pane do
  it_behaves_like Tlux::Splitable do
    let(:splitable) { Tlux::Pane.new(:vertical) }
  end

  it_behaves_like Tlux::Commandable do
    let(:commandable) { Tlux::Pane.new(:vertical) }
  end

  describe "#orientation" do
    context "vertical" do
      subject { Tlux::Pane.new(:vertical) }

      it "should be v" do
        subject.orientation.should == '-v'
      end
    end

    context "horizontal" do
      subject { Tlux::Pane.new(:horizontal) }

      it "should be h" do
        subject.orientation.should == '-h'
      end
    end

    context "default" do
      subject { Tlux::Pane.new }

      it "should be v" do
        subject.orientation.should == '-v'
      end
    end
  end

  describe "size" do
    context "no size specified" do
      subject { Tlux::Pane.new }

      it "should be nil" do
        subject.size.should be_nil
      end
    end

    context "with lines specified" do
      subject { Tlux::Pane.new(:vertical, lines: 20) }

      it "should be -l 20" do
        subject.size.should == "-l 20"
      end
    end

    context "with a percentage specified" do
      subject { Tlux::Pane.new(:vertical, percentage: 20) }

      it "should be -p 20" do
        subject.size.should == "-p 20"
      end
    end
  end
end
