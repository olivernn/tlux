module Tlux
  class Session
    attr_accessor :name
    attr_reader :windows

    def initialize
      @windows = []
    end

    def window(name, opts = {})
      @windows << Tlux::Window.new(name, opts)
    end
  end
end
