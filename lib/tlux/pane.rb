module Tlux
  class Pane
    include Tlux::Splitable
    include Tlux::Commandable

    attr_reader :orientation

    def initialize(orientation, opts = {})
      @orientation = orientation
    end
  end
end
