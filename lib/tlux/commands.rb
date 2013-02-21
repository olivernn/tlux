module Tlux
  module Commands
    extend self

    def run(command_name, args = [])
      raise Tlux::CommandNotFoundError unless available?(command_name)
      name_to_constant(command_name).new(*args).run
    end

    private

    def available?(command_name)
      !!name_to_constant(command_name)
    rescue NameError
      false
    end

    def name_to_constant(command_name)
      self.const_get("#{command_name.capitalize}Command")
    end
  end
end

require 'tlux/commands/base'
require 'tlux/commands/list_command'
require 'tlux/commands/run_command'
require 'tlux/commands/open_command'
