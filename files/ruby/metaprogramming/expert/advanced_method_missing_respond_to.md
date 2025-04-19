## 💎 Advanced method_missing with respond_to_missing?

Combine `method_missing` and `respond_to_missing?` to create dynamic dispatchers while preserving introspection. Always override `respond_to_missing?` to reflect the capabilities your `method_missing` supports.

```ruby
class FlexibleHash
  def initialize
    @data = {}
  end

  def method_missing(name, *args)
    key = name.to_s.gsub(/=$/, '').to_sym
    if name.to_s.end_with?('=')
      @data[key] = args.first
    elsif @data.key?(key)
      @data[key]
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    key = name.to_s.sub(/=$/, '').to_sym
    @data.key?(key) || super
  end
end

h = FlexibleHash.new
h.foo = 'bar'
puts h.foo       # => "bar"
puts h.respond_to?(:foo)  # => true
```