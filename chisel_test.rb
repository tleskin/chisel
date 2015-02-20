require "minitest"
require "minitest/autorun"
require "minitest/emoji"
require_relative "chisel"

class ChiselTest < Minitest::Test

  def test_it_exists
    chisel = Chisel.new
    assert true
  end
end
