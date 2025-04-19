## 🚀 Cache Dynamically Generated Methods

When you intercept undefined methods repeatedly, performance can suffer. Inside `method_missing`, use `define_singleton_method` (or `define_method` on the singleton class) to generate the method the first time it’s called. This way, subsequent calls bypass `method_missing` entirely.

```ruby
class DynamicConfig
  def method_missing(name, *args, &block)
    if config = load_config_for(name)
      singleton_class.define_method(name) { config }
      config
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    load_config_for(name) || super
  end

  private

  def load_config_for(key)
    # Expensive lookup, e.g. from file/db
    { foo: 42, bar: 'baz' }[key]
  end
end

cfg = DynamicConfig.new
cfg.foo  # loads, defines foo
cfg.foo  # direct call, no method_missing overhead
```