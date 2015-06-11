class ListRenderer

attr_reader :input

  NUMBER_PREFIXES = (0..1000).map { |n| "#{n}. " }

  def initialize(input)
    @input = input
  end

  def process_unordered
    while @input.include?("* ")
      @input.sub!("* ", "<li>").sub!("\n", "</li>")
    end
    @input
  end

  def wrap_unordered
    process_unordered.insert(0, "<ul>").insert(-1, "</ul>")
  end

  def process_ordered
    NUMBER_PREFIXES.each do |number|
      while @input.include?("#{number}")
        @input.sub!("#{number}", "<li>").sub!("\n", "</li>")
      end
    end
    @input
  end

  def wrap_ordered
    process_ordered.insert(0, "<ol>").insert(-1, "</ol>")
  end

end
