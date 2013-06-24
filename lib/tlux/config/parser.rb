module Tlux
  module Config
    class FileNotFound < StandardError ; end

    class Parser
      def self.from_file(path)
        raise Tlux::Config::FileNotFound.new(path) unless File.exists?(path) && File.file?(path)
        File.open(path, 'r') do |config|
          self.new(config.read)
        end
      end

      attr_reader :config, :session

      def initialize(config)
        @config = config
        @session = Tlux::Session.new
      end

      def parse!
        session.instance_eval(config)
      end
    end
  end
end
