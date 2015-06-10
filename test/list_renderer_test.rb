require './test/test_helper'

class ListRendererTest < Minitest::Test

  def test_it_finds_one_list_item
    input = "* sushi\n"
    text = ListRenderer.new
    output = text.render_unordered(input)
    expected = "<li>sushi</li>"

    assert_equal expected, output
  end

  def test_it_finds_two_list_items
    input = "* sushi\n* sake\n"
    text = ListRenderer.new
    output = text.render_unordered(input)
    expected = "<li>sushi</li><li>sake</li>"

    assert_equal expected, output
  end

  def test_it_finds_multiple_list_items
    input = "* sushi\n* sake\n* tempura\n"
    text = ListRenderer.new
    output = text.render_unordered(input)
    expected = "<li>sushi</li><li>sake</li><li>tempura</li>"

    assert_equal expected, output
  end

  def test_it_tags_the_start_and_end_of_an_unordered_list
    input = "* sushi\n* sake\n* tempura\n"
    text = ListRenderer.new
    output = text.wrap_unordered(input)
    # output.wrap_unordered(input)
    expected = "<ul><li>sushi</li><li>sake</li><li>tempura</li></ul>"

    assert_equal expected, output
  end

end
