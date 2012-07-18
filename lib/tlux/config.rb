module Tlux
  module Config
    class FileNotFound < StandardError ; end
  end
end

require 'tlux/config/parser'
