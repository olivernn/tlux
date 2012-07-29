module Tlux
  module Commands
    class Start
      def initialize(args)
        @config_file = args.first
      end

      def run
        raise @config_file.inspect
      end
    end
  end
end
