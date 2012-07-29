require 'spec_helper'

describe Tlux::Commands::ListCommand do
  describe "#run" do
    before :each do
      FakeFS.activate!
    end

    after :each do
      FakeFS.deactivate!
    end

    subject { Tlux::Commands::ListCommand.new }

    context "tlux dir not set up" do
      it "should set up the tlux dir" do
        subject.run
        Dir.exists?(File.join(Dir.home, '.tlux')).should be_true
      end
    end

    context "no configs available" do
      let(:list) { subject.run }

      before :each do
        path = File.join(Dir.home, '.tlux')
        Dir.foreach(path) { |filename| File.delete(File.join(path, filename)) if File.exists?(File.join(path, filename)) }
      end

      it "should return an empty array" do
        list.should be_kind_of Array
        list.should be_empty
      end
    end

    context "one config available" do
      let(:list) { subject.run }
      let(:config_name) { 'foo' }

      before :each do
        FileUtils.mkdir_p(File.join(Dir.home, '.tlux', config_name))
      end

      it "should return an array with the name of the config" do
        list.include?(config_name).should be_true
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
          list.include?(config_name).should be_true
        end
      end
    end
  end
end
