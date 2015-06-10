class StrongRenderer

  def render(input)
    add_emphasis_tags(add_strong_tags(input))
  end

  private

  def add_emphasis_tags(input)
    incoming = input
    #checking incoming for presence of even numbers of asterisks
    if incoming.count("*") > 1
      while incoming.include?("*")
        incoming.sub!("*", "<em>").sub!("*", "</em>")
      end
    end
    incoming
  end

  def add_strong_tags(input)
    # replaced = input.gsub("**", "~")
    # count = replaced.chars.count {|char| char == "~"}
    # count.times do |count|
    #   if count %2 == 0
    #     replaced.sub!("~", "<strong>")
    #   else
    #     replaced.sub!("~", "</strong>")
    #   end
    # end
    # replaced
    incoming = input
    #checking incoming for presence of even numbers of asterisks
    if incoming.count("*") > 1
      while incoming.include?("**")
        incoming.sub!("**", "<strong>").sub!("**", "</strong>")
      end
    end
    incoming
  end

end
