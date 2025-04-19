## 🏎 Performance Tuning Large Turbo Frames
For heavy frames containing thousands of elements, split updates into smaller chunks by streaming multiple Turbo Stream messages. This prevents jank by allowing the browser to batch renders.

```ruby
# In your controller or job
records.each_slice(100) do |batch|
  render_stream batch
end

def render_stream(batch)
  turbo_stream.append(
    "large-list",
    partial: "items/item",
    collection: batch
  )
end
```