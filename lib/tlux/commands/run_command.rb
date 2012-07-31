module Tlux
  module Commands
    class RunCommand < Tlux::Commands::Base

      attr_reader :config_name

      def initialize(config_name)
        @config_name = config_name
      end

      def run
        parser = Tlux::Config::Parser.from_file(config_file_path)
        parser.parse!
        parser.session.name = config_name

        write_output Tlux::Config::Generator.new(parser.session).generate!

        exec "tmux -f #{output_path} attach"
      end

      private

      def config_file_path
        File.join(config_path, config_name)
      end

      def output_path
        File.join(generated_path, config_name)
      end

      def write_output(output)
        File.delete(output_path) if File.exists?(output_path)

        file = File.open(output_path, 'w')
        file.write output
        file.close
      end
    end
  end
end
