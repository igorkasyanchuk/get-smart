## ⚙️ Creating Dynamic Attributes

Use `method_missing` to dynamically handle getters and setters without defining each attribute. Pair it with a hash to store values. This pattern mimics OpenStruct in a simplified form.

```ruby
class DynamicStruct
  def initialize
    @attributes = {}
  end

  def method_missing(name, *args)
    name_str = name.to_s
    if name_str.end_with?('=')
      @attributes[name_str.chop.to_sym] = args.first
    elsif @attributes.key?(name)
      @attributes[name]
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.end_with?('=') || @attributes.key?(name) || super
  end
end

person = DynamicStruct.new
person.name = 'Alice'
puts person.name  # => "Alice"
```