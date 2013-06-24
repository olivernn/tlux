module Tlux
  class Session
    attr_accessor :dir
    attr_reader :windows
    attr_writer :name

    def initialize(name = "")
      @name = name
      @dir = Dir.pwd
      @windows = []
    end

    def window(name, opts = {}, &block)
      window = Tlux::Window.new(name, opts)
      @windows << window
      window.instance_eval(&block) if block_given?
    end

    def name
      @name.empty? ? name_from_dir : @name
    end

    def get_binding
      binding
    end

    private

    def name_from_dir
      Pathname.new(dir).basename.to_s.gsub(/\./, '-').gsub(/\:/, '-')
    end
  end
end
