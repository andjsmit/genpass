require 'test/unit'
require 'shoulda'
require '../lib/genpass/options.rb'

class TestOptions < Test::Unit::TestCase
  context 'specifying no arguments' do
    should 'return default values' do
      opts = Genpass::Options.new([''])
      assert_equal Genpass::Options::DEFAULT_PASSTYPE, opts.pass_type
      assert_equal Genpass::Options::DEFAULT_LENGTH, opts.pass_length
      assert_equal Genpass::Options::DEFAULT_DIGITS, opts.pass_digits
    end
  end

  context 'specifying pass type' do
    should 'return pronouncable type' do
      opts = Genpass::Options.new(['-p'])
      assert_equal 'pronouncable', opts.pass_type
    end
  end

  context 'specifying digits' do
    should 'return given number of digits' do
      opts = Genpass::Options.new(['-d', '3'])
      assert_equal 3, opts.pass_digits
    end
  end

  context 'specifying length' do
    should 'return given number of characters' do
      opts = Genpass::Options.new(['--char', '24'])
      assert_equal 24, opts.pass_length
    end
  end
end
