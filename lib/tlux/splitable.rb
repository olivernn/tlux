module Tlux
  module Splitable
    def split(orientation, opts = {})
      panes << Tlux::Pane.new(orientation, opts)
    end

    def panes
      @panes ||= []
    end
  end
end
