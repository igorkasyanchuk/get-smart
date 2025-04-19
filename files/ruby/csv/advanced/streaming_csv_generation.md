## 🔄 Stream CSV Generation with Enumerator

When exporting query results to CSV for web clients, building the entire string can exhaust memory. Use an Enumerator that yields CSV lines on the fly, allowing frameworks like Rack to stream responses.

```ruby
require 'csv'

enum = Enumerator.new do |yielder|
  yielder << CSV.generate_line(['id', 'name', 'email'])
  User.find_each(batch_size: 1_000) do |user|
    yielder << CSV.generate_line([user.id, user.name, user.email])
  end
end

# In Rails controller:
# render plain: enum, content_type: 'text/csv'
```

This approach never holds the full CSV in memory. Clients start downloading data immediately, improving UX and reducing server load.