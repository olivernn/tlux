module Tlux
  module Commands
    class RunCommand < Tlux::Commands::BaseCommand

      attr_reader :config_name

      def initialize(config_name)
        @config_name = config_name
      end

      def run
        parser = Tlux::Config::Parser.from_file(config_path)
        parser.parse!
        parser.session.name = config_name

        write_output Tlux::Config::Generator.new(parser.session).generate!

        exec "tmux -f #{output_path} attach"
      end

      private

      def write_output(output)
        File.delete(output_path) if File.exists?(output_path)

        file = File.open(output_path, 'w')
        file.write output
        file.close
      end
    end
  end
end
