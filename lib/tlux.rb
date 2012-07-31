require "tlux/version"
require "erb"
require "fileutils"

module Tlux
  TEMPLATES_PATH = File.join(File.dirname(__FILE__), 'tlux', 'templates')
  class EditorNotDefinedError < StandardError ; end
end

require "tlux/splitable"
require "tlux/commandable"

require "tlux/session"
require "tlux/window"
require "tlux/pane"

require "tlux/config"
require "tlux/commands"
