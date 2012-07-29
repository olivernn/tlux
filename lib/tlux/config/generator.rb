module Tlux
  module Config
    class Generator

      attr_reader :session, :template

      TEMPLATE_PATH = File.join(File.dirname(__FILE__), '..', 'templates', 'config.erb')

      def initialize(session)
        @session = session
      end

      def generate!
        name = session.name
        windows = session.windows
        dir = Dir.pwd

        template.result(binding)
      end

      private

      def template
        File.open(TEMPLATE_PATH, 'r') do |f|
          ERB.new(f.read)
        end
      end
    end
  end
end
