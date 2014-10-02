require 'spec_helper'

describe Tlux::Commands::ListCommand do
  describe "#run" do
    before :each do
      FakeFS.activate!
      FakeFS::FileSystem.clear
    end

    after :each do
      FakeFS.deactivate!
    end

    subject { Tlux::Commands::ListCommand.new }

    context "tlux dir not set up" do
      it "should set up the tlux dir" do
        subject.run
        expect(Dir.exists?(File.join(Dir.home, '.tlux'))).to eq true
      end
    end

    context "no configs available" do
      let(:list) { subject.run }

      it "should return an empty array" do
        expect(list).to be_kind_of Array
        expect(list).to be_empty
      end
    end

    context "one config available" do
      let(:list) { subject.run }
      let(:config_name) { 'foo' }

      before :each do
        FileUtils.mkdir_p(File.join(Dir.home, '.tlux', config_name))
      end

      it "should return an array with the name of the config" do
        expect(list).to include config_name
      end
    end

    context "more than one config available" do
      let(:list) { subject.run }
      let(:config_names) { %w{foo bar baz} }

      before :each do
        config_names.each do |config_name|
          FileUtils.mkdir_p(File.join(Dir.home, '.tlux', config_name))
        end
      end

      it "should return an array with all the names of the config" do
        config_names.each do |config_name|
          expect(list).to include config_name
        end
      end
    end
  end
end
