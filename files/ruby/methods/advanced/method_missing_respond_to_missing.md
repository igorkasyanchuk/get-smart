## 🕵️ Advanced `method_missing` with `respond_to_missing?`
Override `method_missing` judiciously to delegate or synthesize methods, but pair it with `respond_to_missing?` so introspection (and Rails) works correctly.

```ruby
class Config
  def initialize(settings)
    @settings = settings
  end

  def method_missing(name, *args, &block)
    key = name.to_s.chomp("?")
    return @settings[key.to_sym] if name.to_s.end_with?('?')
    super
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.end_with?('?') || super
  end
end

cfg = Config.new(debug: true)
p cfg.debug?  # => true
p cfg.respond_to?(:debug?) # => true
```