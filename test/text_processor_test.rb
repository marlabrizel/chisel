require './test/test_helper'

class TextProcessorTest < Minitest::Test

  def test_it_renders_a_md_header_in_HTML
    input = "#Here is my header"
    processor = TextProcessor.new(input)
    output = processor.apply_rendering
    expected = "<h1>Here is my header</h1>"

    assert_equal expected, output
  end

  def test_it_renders_a_md_paragraph_in_HTML
    input = "Here is my paragraph"
    processor = TextProcessor.new(input)
    output = processor.apply_rendering
    expected = "<p>Here is my paragraph</p>"

    assert_equal expected, output
  end

  def test_it_renders_paragraphs_and_headers_correctly
    input = "#Header\n\nParagraph blah blah blah"
    processor = TextProcessor.new(input)
    output = processor.apply_rendering
    expected = "<h1>Header</h1>\n\n<p>Paragraph blah blah blah</p>"

    assert_equal expected, output
  end

  def test_it_renders_headers_paragraphs_and_emphases
    input = "#Header\n\nParagraph *blah* **blah** blah"
    processor = TextProcessor.new(input)
    output = processor.apply_rendering
    expected = "<h1>Header</h1>\n\n<p>Paragraph <em>blah</em> <strong>blah</strong> blah</p>"

    assert_equal expected, output
  end

  def test_it_renders_unordered_lists
    input = "#Header\n\nParagraph\n\n* list\n* list\n"
    processor = TextProcessor.new(input)
    output = processor.apply_rendering
    expected = "<h1>Header</h1>\n\n<p>Paragraph</p>\n\n<ul>\n<li>list</li>\n<li>list</li>\n</ul>\n"

    assert_equal expected, output
  end

  def test_it_renders_ordered_lists
    input = "#Header\n\nParagraph\n\n1. list\n2. list\n"
    processor = TextProcessor.new(input)
    output = processor.apply_rendering
    expected = "<h1>Header</h1>\n\n<p>Paragraph</p>\n\n<ol>\n<li>list</li>\n<li>list</li>\n</ol>\n"

    assert_equal expected, output
  end
end
