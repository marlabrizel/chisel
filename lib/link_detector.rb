require 'pry'
require_relative 'link_renderer'
class LinkDetector
attr_reader :input

  def initialize(input)
    @input = input
  end

  def detect_link
    if @input.include?("](")
      unrendered = @input.split("")
      until unrendered[0] == ("[")
        unrendered.shift
      end
      unrendered
      until unrendered[-1] == (")")
        unrendered.pop
      end
      unrendered = unrendered.join("")
      @input.sub!(unrendered, LinkRenderer.new(unrendered).process_link)
    end
  end

end


if __FILE__ == $0
  ld = LinkDetector.new("here is [my link](http://link.com) thing")
  puts ld.detect_link

end
