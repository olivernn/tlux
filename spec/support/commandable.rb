shared_examples_for Tlux::Commandable do
  describe "#command" do
    it "should have add a command to a list of commands" do
      expect {
        commandable.command "vim ."
      }.to change(commandable.commands, :size).by(1)
    end
  end
end
