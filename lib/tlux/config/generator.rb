module Tlux
  module Config
    class Generator

      attr_reader :session, :template

      def initialize(session)
        @session = session
        File.open(File.join('templates/config.erb'), 'r') do |template|
          @template = ERB.new template.read
        end
      end

      def generate!
        template.run(session.get_binding)
      end
    end
  end
end
