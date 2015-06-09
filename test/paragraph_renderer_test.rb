require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/paragraph_renderer'

class ParagraphRendererTest < Minitest::Test

  def test_it_adds_paragraph_tags
    skip
    text = "Howdy"
    paragraph = ParagraphRenderer.new(text)

    assert_equal ['<p>', 'H', 'o', 'w', 'd', 'y', '</p>'], paragraph.add_paragraph_tags
  end

  def test_it_wraps_a_paragraph_in_tags
    text = "Howdy there, pardner!"
    paragraph = ParagraphRenderer.new(text)

    assert_equal "<p>Howdy there, pardner!</p>", paragraph.to_markup
  end

  #add edge case for newline

end
