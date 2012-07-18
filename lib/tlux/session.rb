module Tlux
  class Session
    attr_accessor :name
    attr_reader :windows

    def initialize(name = "")
      @name = name
      @windows = []
    end

    def window(name, opts = {}, &block)
      window = Tlux::Window.new(name, opts)
      @windows << window
      window.instance_eval(&block) if block_given?
    end

    def get_binding
      binding
    end
  end
end
