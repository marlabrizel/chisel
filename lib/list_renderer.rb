class ListRenderer

  def render_unordered(input)
    incoming = input
    while incoming.include?("* ")
      incoming.sub!("* ", "<li>").sub!("\n", "</li>")
    end
    #at the end of the while loop, insert </ul> tag onto end of string
    incoming
  end

  def wrap_unordered(input)
    # binding.pry
    # incoming.gsub("", "<ul>")
    render_unordered(input).insert(0, "<ul>").insert(-1, "</ul>")
  end

end
