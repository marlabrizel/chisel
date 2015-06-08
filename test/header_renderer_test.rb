require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/header_renderer'

class HeaderRendererTest < Minitest::Test

  def test_it_turns_a_single_hash_into_HTML_header
    skip
    heading = HeaderRenderer.new("#Heading 1")

    assert_equal "<h1>Heading 1</h1>", heading.header_tag
  end

  def test_it_counts_hashes_in_a_header
    heading = ['#', 'H', 'e', 'a', 'd', 'i', 'n', 'g', '1']
    header = HeaderRenderer.new(heading)

    assert_equal 1, header.count_hashes
  end

  def test_it_counts_more_than_one_hash
    heading = ['#', '#', 'H', 'e', 'a', 'd', 'i', 'n', 'g', '2']
    header = HeaderRenderer.new(heading)

    assert_equal 2, header.count_hashes
  end

  def test_it_strips_hashes_from_a_header
    heading = ['#', '#', 'H', 'e', 'a', 'd', 'i', 'n', 'g']
    header = HeaderRenderer.new(heading)

    assert_equal ['H', 'e', 'a', 'd', 'i', 'n', 'g'], header.strip_hashes
  end

  def test_it_adds_HTML_tags_to_a_header
    heading = ['#', 'H', 'e', 'a', 'd', 'i', 'n', 'g']
    header = HeaderRenderer.new(heading)

    assert_equal ['<h1>', 'H', 'e', 'a', 'd', 'i', 'n', 'g', '</h1>'], header.add_header_tag
  end

  def test_it_adds_proper_HTML_tag_for_number_of_hashes
    heading = ['#', '#', 'H', 'e', 'a', 'd', 'i', 'n', 'g']
    header = HeaderRenderer.new(heading)

    assert_equal ['<h2>', 'H', 'e', 'a', 'd', 'i', 'n', 'g', '</h2>'], header.add_header_tag
  end

end
