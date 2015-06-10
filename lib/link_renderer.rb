class LinkRenderer

  def initialize(input)
    @input = input.split("](")
  end

  def process_link
    url = @input[1].chop
    tag = @input[0][1..-1]
    formatted = "<a href='#{url}'>#{tag}</a>"
  end

  #[This link](http://example.net/) has no title attribute.
  #<p><a href="http://example.net/">This link</a> has no
#title attribute.</p>

#replace "(" with "<a href=""
#replace ")" with "">"
#replace

#[l](http://hi.com/)
#<a href="http://hi.com/">l</a>

end
