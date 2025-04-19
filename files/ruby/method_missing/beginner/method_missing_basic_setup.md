## 🛠️ Basic `method_missing` Setup

When Ruby encounters a call to a non-existent method, it triggers `method_missing`. You can override it in your class to handle undefined calls gracefully instead of raising `NoMethodError`. This is a great starting point to log or provide defaults for missing methods.

```ruby
class SilentLogger
  def method_missing(method_name, *args, &block)
    puts "Called undefined method: #{method_name} with arguments: #{args.inspect}"
  end
end

obj = SilentLogger.new
obj.anything_you_like(1, 2, 3)
# Output: Called undefined method: anything_you_like with arguments: [1, 2, 3]
```