class HeaderRenderer

  def initialize(header)
    @header = header.split("")
    add_header_tags
  end

  def to_markup
    @header.join("")
  end

  private

  def count_hashes
    count = 0
    @header.each do |char|
      if char == '#'
        count += 1
      end
    end
    count
  end

  def strip_hashes!
    @header.delete_if {|char| char == '#'}
  end

  def add_header_tags
      count = count_hashes
      strip_hashes!
      @header.unshift("<h#{count}>")
      @header << ("</h#{count}>")
    end

end
