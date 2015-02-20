require "minitest"
require "minitest/autorun"
require "minitest/emoji"
require_relative "chisel"

class ChiselTest < Minitest::Test

  def test_it_exists
    chisel = Chisel.new
    assert true
  end

  def test_it_accepts_a_string_of_text
    chisel = Chisel.new
    assert_equal "This is text!", chisel.take_in_text("This is text!")
  end
end
