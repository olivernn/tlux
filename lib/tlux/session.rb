module Tlux
  class Session
    attr_reader :windows

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

    def name(val = nil)
      if val.nil?
        @name.empty? ? name_from_dir : @name
      else
        @name = val
      end
    end

    def dir(val = nil)
      if val.nil?
        @dir
      else
        @dir = val
      end
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
