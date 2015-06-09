class ParagraphRenderer


attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def add_paragraph_tags
    @paragraph.unshift('<p>')
    @paragraph.push('</p>')
  end
  #paragraph renderer should take paragraph chunks
  #and wrap them in tags
  #already in an array

end
