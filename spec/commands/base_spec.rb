require 'spec_helper'

describe Tlux::Commands::Base do
  describe "#setup" do
    before :each do
      FakeFS.activate!
    end

    after :each do
      FakeFS.deactivate!
    end

    subject { Tlux::Commands::Base.new }

    context "tlux directory not present" do
      it "should create the tlux directory structure" do
        subject.setup

        Dir.exists?(File.join(Dir.home, '.tlux')).should be_true
      end
    end

    context "tlux directory already present" do
      before :each do
        FileUtils.mkdir_p(File.join(Dir.home, '.tlux'))
        FileUtils.touch(File.join(Dir.home, '.tlux', 'test'))
      end

      it "should not re-create the directory structure" do
        subject.setup

        Dir.exists?(File.join(Dir.home, '.tlux')).should be_true
        Dir.exists?(File.join(Dir.home, '.tlux')).should be_true
      end

      it "should not loose the existing files" do
        subject.setup

        File.exists?(File.join(Dir.home, '.tlux', 'test')).should be_true
      end
    end
  end

  describe "config_path" do
    subject { Tlux::Commands::Base.new }

    it "should return the path to the config files" do
      subject.config_path.should == File.join(Dir.home, '.tlux')
    end
  end
end
