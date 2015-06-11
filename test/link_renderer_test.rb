require './test/test_helper'

class LinkRendererTest < Minitest::Test

  def test_it_renders_a_basic_link
    input = "[link](http://hi.com/)"
    text = LinkRenderer.new(input)
    output = text.process_link
    expected = "<a href='http://hi.com/'>link</a>"

    assert_equal expected, output
  end

  def test_it_renders_a_link_with_a_title
    input = "[link](http://hi.com/ 'Title')"
    text = LinkRenderer.new(input)
    output = text.process_link
    expected = "<a href='http://hi.com/' title='Title'>link</a>"

    assert_equal expected, output
  end

end
