require './test/test_helper'

class ParagraphRendererTest < Minitest::Test

  def test_it_wraps_a_paragraph_in_tags
    text = "Howdy there, pardner!"
    paragraph = ParagraphRenderer.new(text)

    assert_equal "<p>Howdy there, pardner!</p>", paragraph.to_markup
  end

end
