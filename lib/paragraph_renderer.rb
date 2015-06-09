class ParagraphRenderer

attr_accessor :paragraph

  def initialize(paragraph)
    @paragraph = paragraph.split("")
    add_paragraph_tags
    #putting add_paragraph_tags here fixes idempotence
  end

  def to_markup
    @paragraph.join("")
  end

  private

  def add_paragraph_tags
    @paragraph.unshift('<p>')
    @paragraph.push('</p>')
  end
  #paragraph renderer should take paragraph chunks
  #and wrap them in tags
  #already in an array

end
