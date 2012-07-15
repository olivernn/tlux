module Tlux
  module Commandable
    def command(command)
      commands << command
    end

    def commands
      @commands ||= []
    end
  end
end
