module Tlux
  module Commands
    class NewCommand
      def initialize(config_name)
        @config_name = config_name
      end

      def run
        create_tlux_dir
      end

      private

      def create_tlux_dir
        tlux_dir = File.join(Dir.home, '.tlux')
        FileUtils.mkdir_p(tlux_dir)
      end
    end
  end
end
