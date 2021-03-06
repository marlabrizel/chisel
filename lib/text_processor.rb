require_relative 'header_renderer'
require_relative 'paragraph_renderer'
require_relative 'strong_renderer'
require_relative 'list_renderer'
require_relative 'link_renderer'
require_relative 'link_detector'
require 'pry'

class TextProcessor

attr_reader :text,
            :rendered

  def initialize(text)
    @text = text.split("\n\n")
    @rendered = []
  end

  def count_lines
    lines = @text.map do |chunk|
      chunk.split("\n")
    end
    lines.flatten.size
  end

  def apply_rendering
    @text.map do |chunk|
      if chunk[0] == "#"
        @rendered << HeaderRenderer.new(chunk).to_markup
      elsif chunk[0..1] == "* "
        @rendered << ListRenderer.new(chunk).wrap_unordered
      elsif %w(0 1 2 3 4 5 6 7 8 9).include?(chunk[0])
        @rendered << ListRenderer.new(chunk).wrap_ordered
      elsif chunk.include?("](")
        @rendered << ParagraphRenderer.new(LinkDetector.new(chunk).detect_link).to_markup
      else
        @rendered << ParagraphRenderer.new(chunk).to_markup
      end
    end
    result = @rendered.map do |chunk|
      StrongRenderer.new.render(chunk)
    end
    @rendered = result.join("\n\n")
  end

end
