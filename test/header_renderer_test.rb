require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/header_renderer'

class HeaderRendererTest < Minitest::Test

  # def test_it_counts_hashes_in_a_header
  #   heading = "#Heading 1"
  #   header = HeaderRenderer.new(heading)
  #
  #   assert_equal 1, header.count_hashes
  # end
  #
  # def test_it_counts_more_than_one_hash
  #   heading = "##Heading 2"
  #   header = HeaderRenderer.new(heading)
  #
  #   assert_equal 2, header.count_hashes
  # end
  #
  # def test_it_strips_hashes_from_a_header
  #   heading = "##Heading"
  #   header = HeaderRenderer.new(heading)
  #
  #   assert_equal ['H', 'e', 'a', 'd', 'i', 'n', 'g'], header.strip_hashes
  # end
  #
  # def test_it_adds_HTML_tags_to_a_header
  #   heading = "#Heading"
  #   header = HeaderRenderer.new(heading)
  #
  #   assert_equal ['<h1>', 'H', 'e', 'a', 'd', 'i', 'n', 'g', '</h1>'], header.add_header_tags
  # end
  #
  # def test_it_adds_proper_HTML_tag_for_number_of_hashes
  #   heading = "##Heading"
  #   header = HeaderRenderer.new(heading)
  #
  #   assert_equal ['<h2>', 'H', 'e', 'a', 'd', 'i', 'n', 'g', '</h2>'], header.add_header_tags
  # end

  def test_it_returns_an_HTML_marked_string
    heading = "#Heading"
    header = HeaderRenderer.new(heading)

    assert_equal "<h1>Heading</h1>", header.to_markup
  end

end
