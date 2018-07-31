require 'optparse'

module Genpass
  # Parse arguments for genpass
  class Options
    DEFAULT_PASSTYPE = 'random'
    DEFAULT_LENGTH = 8
    DEFAULT_DIGITS = 0
    DEFAULT_MESSAGE = 'Usage: genpass [ options ]'
    attr_reader :pass_type, :pass_length, :pass_digits

    def initialize(argv)
      @pass_type = DEFAULT_PASSTYPE
      @pass_length = DEFAULT_LENGTH
      @pass_digits = DEFAULT_DIGITS
      parse(argv)
    end

    private

    def parse(argv)
      OptionParser.new do |opts|
        opts.banner = DEFAULT_MESSAGE

        opts.on('-p', '--pronouncable', 'Generate pronouncable password') do
          @pass_type = 'pronouncable'
        end

        opts.on('-c', '--chars count', Integer, 'Number of characters') do |ccount|
          @pass_length = ccount
        end

        opts.on('-d', '--digits count', Integer, 'Number of digits') do |d|
          @pass_digits = d
        end

        opts.on('-h', '--help', 'Show this message.') do
          puts opts
          exit
        end

        begin
          argv = ['-h'] if argv.empty?
          opts.parse!(argv)
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end
    end
  end
end
