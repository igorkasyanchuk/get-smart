## 🛠️ Dynamic Attributes DSL with method_missing
Leverage `method_missing` to build a concise DSL for dynamically defined attributes, avoiding boilerplate getters and setters. Pair it with `respond_to_missing?` to maintain compatibility with reflection and tools like Rails’ form builders. This approach is ideal for classes where attributes are defined at runtime from external schemas or configuration.

```ruby
class DynamicModel
  def initialize(attributes = {})
    @attributes = attributes
  end

  def method_missing(name, *args, &block)
    attr_name = name.to_s.chomp("=")

    if name.to_s.end_with?('=')
      @attributes[attr_name] = args.first
    elsif @attributes.key?(name.to_s)
      @attributes[name.to_s]
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    attr_name = name.to_s.chomp("=")
    @attributes.key?(attr_name) || super
  end
end

user = DynamicModel.new('first_name' => 'Alice')
user.last_name = 'Smith'      # sets @attributes['last_name']
puts user.first_name         # => "Alice"
puts user.respond_to?(:age)  # => false
```