require_relative 'header_renderer'
require_relative 'paragraph_renderer'
require_relative 'strong_renderer'
require_relative 'list_renderer'
require 'pry'

class TextProcessor

attr_reader :text,
            :rendered


  def initialize(text)
    @text = text.split("\n\n")
    @rendered = []
  end

  def apply_rendering
    #need to refactor this to be OO
    @text.map do |chunk|
      if chunk[0] == "#"
        @rendered << HeaderRenderer.new(chunk).to_markup
      elsif chunk[0..1] == "* "
        @rendered << ListRenderer.new(chunk).wrap_unordered
      elsif %w(0 1 2 3 4 5 6 7 8 9).include?(chunk[0])
        @rendered << ListRenderer.new(chunk).wrap_ordered
      else
        @rendered << ParagraphRenderer.new(chunk).to_markup
      end
    end
    result = @rendered.map do |chunk|
      StrongRenderer.new.render(chunk)
    end
    @rendered = result.join("\n\n")
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
