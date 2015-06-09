class HeaderRenderer

attr_accessor :header

  def initialize(header)
    @header = header.split("")
    # add_header_tags
    # this breaks all of my tests even though
    # it works, so what's the right level of testing
  end

  def to_markup
    @header.join("")
  end

  def count_hashes
    count = 0
    @header.each do |char|
      if char == '#'
        count += 1
      end
    end
    count
    #count hashes
  end

  def strip_hashes
    @header.delete_if {|char| char == '#'}
    #remove hashes
  end

  def add_header_tags
    if count_hashes == 1
      self.strip_hashes.unshift('<h1>')
      self.strip_hashes.push('</h1>')
    elsif count_hashes == 2
      self.strip_hashes.unshift('<h2>')
      self.strip_hashes.push('</h2>')
    elsif count_hashes == 3
      self.strip_hashes.unshift('<h3>')
      self.strip_hashes.push('</h3>')
    elsif count_hashes == 4
      self.strip_hashes.unshift('<h4>')
      self.strip_hashes.push('</h4>')
    elsif count_hashes == 5
      self.strip_hashes.unshift('<h5>')
      self.strip_hashes.push('</h5>')
    end
    #we want to replace a hash at the beginning of an array with <h1> and </h1> at either end of the array
  end

end
