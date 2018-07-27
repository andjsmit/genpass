require_relative 'generator'
require_relative 'options'

module Genpass
  # Program flow for genpass
  class Runner
    def initialize(argv)
      @options = Options.new(argv)
    end

    def run
      generator = Generator.new
    end
  end
end
