## 🔑 Extend Cache Key Generation for Complex Objects
Override `cache_key` on domain objects to incorporate nested associations or attributes. This ensures fine-grained invalidation without bloating fragment stores.

```ruby
class Catalog
  def cache_key
    timestamp = products.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{self.class.name.downcase}/#{id}-#{timestamp}"
  end
end

# Usage in view
<%= cache @catalog do %>
  <!-- cached content -->
<% end %>
```

This approach yields cache keys sensitive to associated changes, reducing stale fragments.