## 🔄 Stream Large YAML with Psych::Parser and Handler

When working with huge or streaming YAML documents, loading everything at once can blow up memory. By subclassing `Psych::Handler` and feeding chunks to `Psych::Parser`, you can react to each event (mapping, sequence, scalar) as it happens and discard data you don’t need.

```ruby
require 'yaml'
require 'psych'

class MyHandler < Psych::Handler
  def initialize
    @path = []
  end

  def start_mapping(anchor, tag, implicit, style)
    @path.push({})
  end

  def scalar(value, anchor, tag, plain, quoted, style)
    # Called for every scalar; you can filter by @path state
    puts "Scalar at #{@path.size}: #{value.inspect}"
  end

  def end_mapping
    finished = @path.pop
    # Process or save the 'finished' mapping if needed
  end
end

handler = MyHandler.new
parser  = Psych::Parser.new(handler)

File.open('huge.yml', 'r') do |f|
  f.each_line { |line| parser.parse(line) }
end