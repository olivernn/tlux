module Tlux
  module Commands
    class Start
      def initialize(args)
        @config_file = args.first
      end

      def run
        puts @config_file
      end
    end
  end
end
