require_relative 'text_processor'

# Converted my_input.markdown (6 lines) to my_output.html (8 lines)
markdown = File.read(ARGV[0])
processor = TextProcessor.new(markdown)
processor.apply_rendering
markup = processor.rendered
File.open(ARGV[1], "w") { |file| file.write(markup) }

puts "Converted #{ARGV[0]} (#{processor.count_input_lines} lines) to #{ARGV[1]}"
#write a test to ensure it takes a file and spits another out
