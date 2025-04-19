## 🛡️ Deep Freeze for Immutable Arrays
Ensure complete immutability of nested arrays by performing a recursive freeze. This prevents accidental mutations in complex data structures shared across threads or modules.

```ruby
class Array
  def deep_freeze
    each { |el| el.deep_freeze if el.respond_to?(:deep_freeze) }
    freeze
  end
end

# Usage
config = [[1,2], [3,4]].deep_freeze
config.frozen?           # => true
config[0].frozen?       # => true
```