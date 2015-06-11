class ParagraphRenderer

attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph.split("")
    add_paragraph_tags
  end

  def to_markup
    @paragraph.join("")
  end

  private

  def add_paragraph_tags
    @paragraph.unshift('<p>')
    @paragraph.push('</p>')
  end

end
