module Tlux
  module Config
    class Generator

      attr_reader :session, :template

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
        File.open(File.join(Tlux::TEMPLATES_PATH, 'config.erb'), 'r') do |f|
          ERB.new(f.read)
        end
      end
    end
  end
end
