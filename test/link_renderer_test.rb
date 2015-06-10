require './test/test_helper'

class LinkRendererTest < Minitest::Test

  def test_it_renders_a_basic_link
    input = "[link](http://hi.com/)"
    text = LinkRenderer.new(input)
    output = text.process_link
    expected = "<a href='http://hi.com/'>link</a>"

    assert_equal expected, output
  end

  def test_it_finds_a_link_in_text
    input = "Chipotle [yum](http://www.chipotle.com/)"
    text = LinkRenderer.new(input)
    output = text.process_link
    expected = "Chipotle <a href='http://www.chipotle.com/'>yum</a>"

    assert_equal expected, output
  end

end
