require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/text_processor'

class TextProcessorTest < Minitest::Test

  def test_it_renders_a_md_header_in_HTML
    input = "#Here is my header"
    processor = TextProcessor.new(input)
    output = processor.apply_rendering
    expected = "<h1>Here is my header</h1>"

    assert_equal expected, output
  end

  def test_it_renders_a_md_paragraph_in_HTML
    skip
  end

  def test_it_renders_paragraphs_and_headers_correctly
  #pass in a string that contains both a header and a
  #paragraph and ensure both are processed correctyl
    input = "#Header\n\nParagraph blah blah blah"
    processor = TextProcessor.new(input)
    output = processor.apply_rendering
    expected = "<h1>Header</h1>\n\n<p>Paragraph blah blah blah</p>"

    assert_equal expected, output
  end

  def test_it_renders_headers_paragraphs_and_emphases
  end

end
