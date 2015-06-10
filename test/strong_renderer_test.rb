require "./test/test_helper"

class StrongRendererTest < Minitest::Test

  def test_it_replaces_double_stars_with_strong_tags
    input = "**strong**"
    text = StrongRenderer.new
    output = text.render(input)
    expected = "<strong>strong</strong>"

    assert_equal expected, output
  end

  def test_it_replaces_double_stars_within_string_with_strong_tags
    input = "This text is **strong**"
    text = StrongRenderer.new
    output = text.render(input)
    expected = "This text is <strong>strong</strong>"

    assert_equal expected, output
  end

  def test_it_replaces_single_stars_with_em_tags
    input = "*italics*"
    text = StrongRenderer.new
    output = text.render(input)
    expected = "<em>italics</em>"

    assert_equal expected, output
  end

  def test_it_finds_multiple_instances_of_emphases
    input = "*italics* plus more *italics*"
    text = StrongRenderer.new
    output = text.render(input)
    expected = "<em>italics</em> plus more <em>italics</em>"

    assert_equal expected, output
  end

  def test_it_finds_both_strong_and_italics_and_replaces_them
    input = "*italics* plus some **bold things**"
    text = StrongRenderer.new
    output = text.render(input)
    expected = "<em>italics</em> plus some <strong>bold things</strong>"

    assert_equal expected, output
  end

  def test_it_replaces_for_nested_strongs_and_italics
    input = "This *test is **totally** going* to break"
    text = StrongRenderer.new
    output = text.render(input)
    expected = "This <em>test is <strong>totally</strong> going</em> to break"

    assert_equal expected, output
  end

  def test_it_does_not_render_a_lonely_asterisk
    input = "*This should be left alone"
    text = StrongRenderer.new
    output = text.render(input)
    expected = "*This should be left alone"

    assert_equal expected, output
  end

end
