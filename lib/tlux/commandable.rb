module Tlux
  module Commandable
    def command(command)
      commands << command
    end

    def commands
      @commands ||= []
    end

    def directory(directory = nil)
      @directory = directory unless directory.nil?
      @directory
    end
  end
end
