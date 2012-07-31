module Tlux
  module Commands
    class NewCommand < Tlux::Commands::Base
      attr_reader :config_name

      def initialize(config_name)
        @config_name = config_name
      end

      def run(open_editor = true)
        setup
        create_config unless File.exists?(config_file_path)
        raise Tlux::EditorNotDefinedError unless editor
        exec "#{editor} #{config_file_path}" if open_editor
      end

      private

      def editor
        [ENV['TLUX_EDITOR'], ENV['VISUAL'], ENV['EDITOR']].find{|e| !e.nil? && !e.empty? }
      end

      def config_file_path
        File.join(config_path, config_name)
      end

      def create_config
        File.open(config_file_path, 'w+') do |f|
          f.write template.result(binding)
        end
      end

      def template
        File.open(File.join(Tlux::TEMPLATES_PATH, 'new.erb'), 'r') do |f|
          ERB.new(f.read)
        end
      end
    end
  end
end
