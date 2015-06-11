require './test/test_helper'

class LinkDetectorTest < Minitest::Test

  def test_it_sends_a_link_through_the_link_renderer
    input = "blah blah [link](http://hi.com/) blah blah"
    detector = LinkDetector.new(input)
    detector.detect_link
    expected = "blah blah <a href='http://hi.com/'>link</a> blah blah"

    assert_equal expected, input
  end

end
