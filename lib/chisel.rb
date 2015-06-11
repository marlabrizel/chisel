require_relative 'text_processor'

markdown = File.read(ARGV[0])
processor = TextProcessor.new(markdown)
processor.apply_rendering
markup = processor.rendered
File.open(ARGV[1], "w") { |file| file.write(markup) }

puts "Converted #{ARGV[0]} (#{processor.count_lines} lines) to #{ARGV[1]} (#{processor.count_lines} lines)"
