## 🔁 Selective Serialization of Instance Variables

Use `marshal_dump` and `marshal_load` to include only essential instance variables, skipping caches or transient state. This leads to leaner dumps and avoids serializing sensitive or bulky data.

```ruby
class Config
  def initialize(params)
    @params = params
    @cache  = compute_cache(params)
  end

  # Only serialize @params, skip @cache
  def marshal_dump
    @params
  end

  def marshal_load(data)
    @params = data
    # Reconstruct transient cache after loading
    @cache = compute_cache(@params)
  end

  private

  def compute_cache(params)
    # expensive computation
    params.values.sum
  end
end

# Usage:
cfg = Config.new(foo: 1, bar: 2)
data = Marshal.dump(cfg)
new_cfg = Marshal.load(data)
```