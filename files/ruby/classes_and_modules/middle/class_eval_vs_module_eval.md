## 🕹️ Dynamically Adding Methods with `class_eval`

Use `class_eval` or `module_eval` to inject methods or constants at runtime. This approach is helpful in metaprogramming for DSLs or dynamic API wrappers.

```ruby
class APIClient; end

APIClient.class_eval do
  def fetch(resource)
    "Fetching \\#{resource}"
  end
end

client = APIClient.new
puts client.fetch('users')
# => "Fetching users"
```