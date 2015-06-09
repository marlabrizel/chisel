require_relative 'paragraph_renderer'
require_relative 'header_renderer'
require_relative 'assembler'
require_relative 'text_divider'

# $ ruby ./lib/chisel.rb my_input.markdown my_output.html
# Converted my_input.markdown (6 lines) to my_output.html (8 lines)
markdown = File.read(ARGV[0])
processor = TextProcessor.new(markdown)
puts "Converted #{ARGV[0]} to #{ARGV[1]}"
