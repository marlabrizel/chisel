require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/paragraph_renderer'

class ParagraphRendererTest < Minitest::Test

  def test_it_wraps_a_paragraph_in_tags
    text = "Howdy"
    paragraph = ParagraphRenderer.new(text)

    assert_equal ['<p>', 'H', 'o', 'w', 'd', 'y', '</p>'], paragraph.add_paragraph_tags
  end

  #add edge case for newline

end
