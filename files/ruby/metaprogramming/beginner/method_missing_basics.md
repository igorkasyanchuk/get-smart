## 🔍 Intercept Calls with `method_missing`

The `method_missing` hook is called when an undefined method is invoked. You can use it to catch and handle dynamic methods, such as delegating or generating behavior on the fly. Always pair it with `respond_to_missing?` to keep introspection working.

```ruby
class DynamicHash
  def initialize
    @data = {}
  end

  def method_missing(name, *args)
    key = name.to_s.chomp("=")
    if name.to_s.end_with?("=")
      @data[key] = args.first
    else
      @data[key]
    end
  end

  def respond_to_missing?(name, _)
    true
  end
end

h = DynamicHash.new
h.color = "blue"
puts h.color           # => "blue"
```