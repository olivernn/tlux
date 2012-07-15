module Tlux
  class Window
    include Tlux::Splitable
    include Tlux::Commandable

    attr_reader :name

    def initialize(name, opts = {})
      @name = name
    end
  end
end
