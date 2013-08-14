module Tlux
  module Commands
    class Base
      def setup
        FileUtils.mkdir_p(File.join(Dir.home, '.tlux'))
      end

      def config_path
        File.join(Dir.home, '.tlux')
      end
    end
  end
end
