module Tlux
  module Commands
    def self.run(command_name, args = [])
      command = self.const_get("#{command_name.capitalize}Command").new(*args)
      command.run
    end
  end
end

require 'tlux/commands/base'
require 'tlux/commands/list_command'
require 'tlux/commands/run_command'
require 'tlux/commands/new_command'
