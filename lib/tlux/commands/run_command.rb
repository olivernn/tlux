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
    end
  end
end
