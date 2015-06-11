class ListRenderer

attr_reader :input

  NUMBER_PREFIXES = (0..1000).map { |n| "#{n}. " }

  def initialize(input)
    @input = input
  end

  def process_unordered
    lines = @input.split("\n")
    lines.map do |line|
      line.sub!("* ", "<li>")
      line << "</li>"
    end
    formatted = lines.join("")
  end

  def wrap_unordered
    process_unordered.insert(0, "<ul>").insert(-1, "</ul>")
  end

  def process_ordered
    lines = @input.split("\n")
    NUMBER_PREFIXES.each do |number|
      lines.map do |line|
        if line.include?("#{number}")
          line << "</li>"
          line.sub!("#{number}", "<li>")
        end
      end
    end
    formatted = lines.join("")
  end

  def wrap_ordered
    process_ordered.insert(0, "<ol>").insert(-1, "</ol>")
  end

end
