## 🔄 Streaming Large JSON Datasets with Oj::StreamReader

When working with very large JSON files or streams, loading the entire document into memory can be infeasible. Oj’s streaming APIs let you parse and process data incrementally, keeping memory usage low and enabling pipeline-style processing.

```ruby
require 'oj'

File.open('large_items.json', 'r') do |file|
  reader = Oj::StreamReader.new(file)
  while reader.next
    # Process objects under 'items' array without full load
    if reader.path.start_with?('items')
      item = reader.value
      # e.g., insert into database
      process_item(item)
    end
  end
end
```