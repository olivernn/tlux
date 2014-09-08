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

        expect(Dir.exists? tlux_config_file).to eq true
        expect(Dir.exists? tlux_generated_dir).to eq true
      end
    end

    context "tlux directory already present" do
      before :each do
        FileUtils.mkdir_p tlux_generated_dir
        FileUtils.touch tlux_config_test_file
        FileUtils.touch tlux_generated_file('test')
      end

      it "should not re-create the directory structure" do
        subject.setup

        expect(Dir.exists? tlux_config_file).to eq true
        expect(Dir.exists? tlux_generated_dir).to eq true
      end

      it "should not loose the existing files" do
        subject.setup

        expect(File.exists? tlux_config_test_file).to eq true
        expect(File.exists? tlux_generated_file('test')).to eq true
      end
    end
  end

  describe "config_path" do
    subject { Tlux::Commands::Base.new }

    it "should return the path to the config files" do
      expect(subject.config_path).to eq tlux_config_file
    end
  end

  describe "generated_path" do
    subject { Tlux::Commands::Base.new }

    it "should return the path to the generated files" do
      expect(subject.generated_path).to eq tlux_generated_dir
    end
  end
end
