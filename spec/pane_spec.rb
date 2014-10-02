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
        expect(subject.orientation).to eq '-v'
      end
    end

    context "horizontal" do
      subject { Tlux::Pane.new(:horizontal) }

      it "should be h" do
        expect(subject.orientation).to eq '-h'
      end
    end

    context "default" do
      subject { Tlux::Pane.new }

      it "should be v" do
        expect(subject.orientation).to eq '-v'
      end
    end
  end

  describe "size" do
    context "no size specified" do
      subject { Tlux::Pane.new }

      it "should be nil" do
        expect(subject.size).to be_nil
      end
    end

    context "with lines specified" do
      subject { Tlux::Pane.new(:vertical, lines: 20) }

      it "should be -l 20" do
        expect(subject.size).to eq "-l 20"
      end
    end

    context "with a percentage specified" do
      subject { Tlux::Pane.new(:vertical, percentage: 20) }

      it "should be -p 20" do
        expect(subject.size).to eq "-p 20"
      end
    end
  end
end
