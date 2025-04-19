## 🌀 Dynamic Method Definition with `define_method`
Use `define_method` in combination with metaprogramming to DRY up repetitive method definitions. This pattern is powerful when building attribute-based behaviors dynamically.

```ruby
class Settings
  %i[timeout retries verbose].each do |attr|
    define_method(attr) do
      @config ||= {}
      @config[attr]
    end

    define_method("#{attr}=") do |value|
      @config ||= {}
      @config[attr] = value
    end
  end
end

s = Settings.new
s.timeout = 30
puts s.timeout  # => 30
```