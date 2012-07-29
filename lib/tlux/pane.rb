module Tlux
  class Pane
    include Tlux::Splitable
    include Tlux::Commandable

    attr_reader :lines, :percentage

    def initialize(orientation = :vertical, opts = {})
      @orientation = orientation
      @lines = opts[:lines]
      @percentage = opts[:percentage]
    end

    def orientation
      "-#{@orientation.to_s.chars.first}"
    end

    def size
      if lines
        "-l #{lines}"
      elsif percentage
        "-p #{percentage}"
      end
    end
  end
end
