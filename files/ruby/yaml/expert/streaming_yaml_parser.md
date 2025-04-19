## 📊 Event-Driven Streaming Parsing for Large YAML Files

When dealing with multi-gigabyte YAML documents, loading the entire file into memory is impractical. Use `Psych::Parser` with a custom event handler to process tokens (scalars, mappings, sequences) on‑the‑fly, achieving constant memory usage. This pattern is ideal for ETL pipelines, log processing, or any service that must handle YAML streams in real time.

```ruby
require 'psych'

class EventHandler < Psych::Handler
  def initialize
    @path = []
  end

  def start_mapping(anchor, tag, implicit, style)
    @path.push({})
  end

  def scalar(value, anchor, tag, plain, quoted, style)
    # Handle each scalar event as it arrives
    puts "Encountered: #{value} at depth #{@path.size}"
  end

  def end_mapping
    @path.pop
  end
end

handler = EventHandler.new
parser = Psych::Parser.new(handler)
File.open('large_data.yaml', 'r') do |f|
  f.each_line { |line| parser.parse(line) }
end
```