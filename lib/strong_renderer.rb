class StrongRenderer

attr_accessor :input

  def initialize(input)
    @input = input
  end

  def add_strong_tags
    replaced = @input.gsub("**", "~")
    count = replaced.chars.count {|char| char == "~"}
    count.times do |count|
      if count %2 == 0
        replaced.sub!("~", "<strong>")
      else
        replaced.sub!("~", "</strong>")
      end
    end
    replaced
  end

  def add_emphasis_tags
    incoming = add_strong_tags
    while incoming.include?("*")
      incoming.sub!("*", "<em>").sub!("*", "</em>")
    end

    incoming
  end

end
