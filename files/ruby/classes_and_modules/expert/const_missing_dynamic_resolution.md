## 🔍 Dynamic Constant Resolution with `const_missing`
Override `const_missing` to handle missing constants at runtime—ideal for on-the-fly proxy classes or multi-tenant namespaces. Be cautious: always call `super` for truly missing constants to preserve expected `NameError` behavior.

```ruby
module ServiceFactory
  def self.const_missing(name)
    klass = Class.new do
      define_method(:call) { |*args| puts "Calling #{name} with \\u{2026}" }
    end
    const_set(name, klass)
  end
end

ServiceFactory::EmailService.new.call('hi')
```

This pattern auto-defines service objects under a common module.