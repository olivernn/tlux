require 'pathname'

module Tlux
  module Commands
    class RunCommand < Tlux::Commands::Base

      attr_reader :config_name, :dir

      def initialize(config_name, dir = '')
        @config_name = config_name
        @dir = dir
      end

      def run
        parser = Tlux::Config::Parser.from_file(config_file_path)
        parser.parse!

        unless dir.empty?
          parser.session.dir(dir)
        end

        exec Tlux::Config::Generator.new(parser.session).generate!
      end

      private

      def config_file_path
        File.join(config_path, config_name)
      end

      def output_path
        File.join(generated_path, session_name)
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
