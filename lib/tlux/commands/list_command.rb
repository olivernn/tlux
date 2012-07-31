module Tlux
  module Commands
    class ListCommand < Tlux::Commands::Base
      def run
        setup

        ignored = %w{. .. generated}

        Dir.entries(config_path).reject { |filename| ignored.include? filename }
      end
    end
  end
end
