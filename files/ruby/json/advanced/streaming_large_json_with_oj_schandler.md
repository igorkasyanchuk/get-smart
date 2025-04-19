## 📦 Streaming Large JSON Parsing with Oj ScHandler

When working with enormous JSON files that can’t fit into memory, use Oj::ScHandler for event-driven streaming. Implement callback methods to process elements as they arrive, avoiding full in-memory deserialization.

```ruby
require 'oj'

class MyHandler < Oj::ScHandler
  def initialize
    @stack = []
  end

  def hash_start
    @stack.push({})
  end

  def array_start
    @stack.push([])
  end

  def add_value(value)
    container = @stack.last
    if container.is_a?(Array)
      container << value
    else
      key, = @current_key_pair
      container[key] = value
    end
  end

  def hash_end
    value = @stack.pop
    add_value(value)
  end

  # ... implement other callbacks: array_end, add_value, hash_start etc.
end

# Stream parse in chunks
handler = MyHandler.new
parser = Oj::ScParser.new(handler)
File.open('huge_data.json') do |file|
  while chunk = file.read(8 * 1024) # 8KB chunks
    parser << chunk
  end
end
```