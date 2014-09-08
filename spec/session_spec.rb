require 'spec_helper'

describe Tlux::Session do
  let(:session) { Tlux::Session.new }

  describe "#name" do
    context "default" do
      before { allow(Dir).to receive(:pwd).and_return('/path/to/project.js') }

      subject { session.name }

      it 'should have the correct project name' do
        expect(subject).to eq 'project-js'
      end
    end

    context "settable" do
      it "should have a name" do
        session.name("foo")
        expect(session.name).to eq 'foo'
      end
    end
  end

  describe "#dir" do
    before { allow(Dir).to receive(:pwd).and_return(:pwd) }
    subject { session }

    context "default" do
      it 'should return the correct working directory' do
        expect(subject.dir).to eq :pwd
      end
    end

    context "settable" do
      before { session.dir(:foo) }

      it 'should be settable' do
        expect(subject.dir).to eq :foo
      end
    end
  end

  describe "#window" do
    let(:name) { "bar" }
    let(:opts) { {:baz => true} }

    it "should create a new window" do
      allow(Tlux::Window).to receive(:new).with(name, opts)
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

      expect(window).to be_kind_of Tlux::Window
      expect(window.name).to eq 'foo'
    end
  end
end
