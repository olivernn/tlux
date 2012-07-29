module Tlux
  module Commands
    class BaseCommand
      def setup
        FileUtils.mkdir_p(File.join(Dir.home, '.tlux', 'generated'))
      end

      def config_path
        File.join(Dir.home, '.tlux')
      end

      def generated_path
        File.join(Dir.home, '.tlux', 'generated')
      end
    end
  end
end
