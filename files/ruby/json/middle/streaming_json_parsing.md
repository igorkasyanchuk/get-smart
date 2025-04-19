## 📥 Stream Large JSON Payloads Efficiently
When working with big JSON files, loading the entire content into memory can cause performance bottlenecks or even OOM errors. By using `JSON.load` on an IO object or a streaming parser like `Oj`, you can process chunks incrementally without blowing up memory usage.

```ruby
# Using stdlib JSON to stream from a file
File.open('huge_data.json') do |file|
  JSON.load(file) do |obj|
    # process each top-level object or array element
    handle_record(obj)
  end
end
```

```ruby
# Using Oj for event-based streaming
require 'oj'
handler = Class.new do
  def initialize; end
  def hash_start; puts "New object:"; end
  def hash_end; end
  def array_start; end
  def array_end; end
  def add_value(value); handle_record(value); end
end.new

Oj.sc_parse(handler, File.read('huge_data.json'))
```

This approach lets you parse and process JSON incrementally, reducing peak memory usage.