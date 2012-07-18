module Tlux
  module Splitable
    def split(orientation, opts = {}, &block)
      pane = Tlux::Pane.new(orientation, opts)
      panes << pane
      pane.instance_eval(&block) if block_given?
    end

    def panes
      @panes ||= []
    end
  end
end
