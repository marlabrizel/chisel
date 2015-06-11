require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/header_renderer'

class HeaderRendererTest < Minitest::Test

  def test_it_returns_an_HTML_marked_string
    heading = "#Heading"
    header = HeaderRenderer.new(heading)

    assert_equal "<h1>Heading</h1>", header.to_markup
  end

  def test_it_returns_another_HTML_marked_string
    heading = "##Heading 2"
    header = HeaderRenderer.new(heading)

    assert_equal "<h2>Heading 2</h2>", header.to_markup
  end

end
