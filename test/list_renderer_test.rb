require './test/test_helper'

class ListRendererTest < Minitest::Test

  def test_it_finds_one_unordered_list_item
    input = "* sushi\n"
    text = ListRenderer.new(input)
    output = text.process_unordered
    expected = "<li>sushi</li>"

    assert_equal expected, output
  end

  def test_it_finds_two_unordered_list_items
    input = "* sushi\n* sake\n"
    text = ListRenderer.new(input)
    output = text.process_unordered
    expected = "<li>sushi</li><li>sake</li>"

    assert_equal expected, output
  end

  def test_it_finds_multiple_unordered_list_items
    input = "* sushi\n* sake\n* tempura\n"
    text = ListRenderer.new(input)
    output = text.process_unordered
    expected = "<li>sushi</li><li>sake</li><li>tempura</li>"

    assert_equal expected, output
  end

  def test_it_tags_the_start_and_end_of_an_unordered_list
    input = "* sushi\n* sake\n* tempura\n"
    text = ListRenderer.new(input)
    output = text.wrap_unordered
    expected = "<ul><li>sushi</li><li>sake</li><li>tempura</li></ul>"

    assert_equal expected, output
  end

  def test_it_finds_one_ordered_list_item
    input = "1. sushi\n"
    text = ListRenderer.new(input)
    output = text.process_ordered
    expected = "<li>sushi</li>"

    assert_equal expected, output
    end

  def test_it_finds_two_ordered_list_items
    input = "1. sushi\n2. sake\n"
    text = ListRenderer.new(input)
    output = text.process_ordered
    expected = "<li>sushi</li><li>sake</li>"

    assert_equal expected, output
  end

  def test_it_doesnt_care_what_numbers_are_used
    input = "1. sushi\n1. sake\n"
    text = ListRenderer.new(input)
    output = text.process_ordered
    expected = "<li>sushi</li><li>sake</li>"

    assert_equal expected, output
  end

  def test_it_tags_the_start_and_end_of_an_ordered_list
    input = "1. sushi\n2. sake\n3. tempura\n"
    text = ListRenderer.new(input)
    output = text.wrap_ordered
    expected = "<ol><li>sushi</li><li>sake</li><li>tempura</li></ol>"

    assert_equal expected, output
  end


end
