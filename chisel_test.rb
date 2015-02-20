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
    assert_equal 'This is text!', chisel.take_in_text('This is text!')
  end

  def test_it_recognizes_a_hashtag_in_text_string
    chisel = Chisel.new
    chisel.recognize_hashtag('#This is text!')
    assert true, chisel.recognize_hashtag('#This is text!')
  end

  def test_it_removes_hashtag_encapsulates_with_h1
    chisel = Chisel.new
    assert_equal ["<h1>This is text</h1>"], chisel.encapsulate_text('#This is text'.split(/^\n/))
  end

  def test_it_removes_hashtag_encapsulates_with_h2
    chisel = Chisel.new
    assert_equal ["<h2>This is text</h2>"], chisel.encapsulate_text('##This is text'.split(/^\n/))
  end

  def test_it_removes_hashtag_encapsulates_with_paragraph_tag
    chisel = Chisel.new
    assert_equal ["<p>This is text</p>"], chisel.encapsulate_text('This is text'.split(/^\n/))
  end
end
