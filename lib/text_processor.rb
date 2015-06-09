require_relative 'header_renderer'
require_relative 'paragraph_renderer'

class TextProcessor

attr_accessor :text

  def initialize(text)
    @text = text.split("\n\n")
    @rendered = []
  end

  def apply_rendering
    @text.map do |chunk|
      if chunk[0] == "#"
        @rendered << HeaderRenderer.new(chunk)
      else
        @rendered << ParagraphRenderer.new(chunk)
      end
    end
    #does element[0] == #. yes, true
  end

#iterate through entire text blob and split into series of arrays on "\n\n"
#for each array in the series, if element[0] == '#', send to header_renderer
#else, send to paragraph_renderer
#send to next machine components in array form so that
#text is ready to parse further
#arrange arrays into header and paragraph arrays?
#transformed arrays then need to be sent back into a new array of arrays to be processed
#by the final renderer
end

#take line-break-split array and with an enumerable,
#go through each element and determine whether it's a
# header or paragraph. instantiate correct class based
#on answer
