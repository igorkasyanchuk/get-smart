## 🚀 Streaming JSON Parsing with Oj::ScHandler for Low-Memory Processing

For very large or continuous JSON streams (e.g., logs, message queues), you can implement `Oj::ScHandler` to parse incrementally, emitting events or objects as they arrive. This avoids loading the entire document into memory and enables real‑time transformations or filtering:

```ruby
require 'oj'

class EventHandler < Oj::ScHandler
  def initialize
    @stack = []
  end

  def hash_start
    {}
  end

  def hash_end(obj)
    process_record(obj) if @stack.empty? # top‑level hash
  end

  def array_start
    []
  end

  def array_end(obj)
    # handle arrays if streaming arrays
    obj.each { |item| process_record(item) }
  end

  def hash_key(key)
    @current_key = key
  end

  def add_value(value)
    if @stack.empty?
      @stack.push(value)
    else
      parent = @stack.last
      if parent.is_a?(Array)
        parent << value
      else
        parent[@current_key] = value
      end
    end
  end

  private

  def process_record(record)
    # complex transformation or queue submission
    puts record.inspect
  end
end

# Open an IO stream (e.g., a file, socket, or STDIN)
handler = EventHandler.new
File.open('streaming.json') do |f|
  Oj.sc_parse(handler, f)
end
``` 

Leverage this pattern to build memory‑safe pipelines, custom aggregators, or integrate with message brokers.