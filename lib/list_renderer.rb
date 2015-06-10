class ListRenderer

  def render_unordered(input)
    incoming = input
    while incoming.include?("* ")
      incoming.sub!("* ", "<li>").sub!("\n", "</li>")
    end
    incoming
  end

  def wrap_unordered(input)
    render_unordered(input).insert(0, "<ul>").insert(-1, "</ul>")
  end

  def render_ordered(input)
    incoming = input
    (0..1000).each do |number|
      while incoming.include?("#{number}. ")
        incoming.sub!("#{number}. ", "<li>").sub!("\n", "</li>")
      end
    end
    incoming
  end

  def wrap_ordered(input)
    render_ordered(input).insert(0, "<ol>").insert(-1, "</ol>")
  end

end
