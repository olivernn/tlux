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

require "tlux/config/generator"
require "tlux/config/parser"

require 'tlux/commands/base'
require 'tlux/commands/list_command'
require 'tlux/commands/run_command'
require 'tlux/commands/open_command'
