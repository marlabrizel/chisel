class StrongRenderer

  def render(input)
    add_emphasis_tags(add_strong_tags(input))
  end

  private

  def add_emphasis_tags(input)
    incoming = input
    if incoming.count("*") > 1
      while incoming.include?("*")
        incoming.sub!("*", "<em>").sub!("*", "</em>")
      end
    end
    incoming
  end

  def add_strong_tags(input)
    incoming = input
    if incoming.count("*") > 1
      while incoming.include?("**")
        incoming.sub!("**", "<strong>").sub!("**", "</strong>")
      end
    end
    incoming
  end

end
