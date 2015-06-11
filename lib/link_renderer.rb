class LinkRenderer

  def initialize(input)
    @input = input.split("](")
  end

  def process_link
    url = @input[1].chop
    tag = @input[0][1..-1]
    if url.include?(" ")
      title_url = url.split(" ")
      title = title_url[1]
      formatted = "<a href='#{title_url[0]}' title=#{title}>#{tag}</a>"
    else
      formatted = "<a href='#{url}'>#{tag}</a>"
    end
  end
  
end
