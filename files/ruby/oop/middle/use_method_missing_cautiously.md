## 🔍 Use `method_missing` Cautiously for Dynamic APIs

`method_missing` can help build elegant DSLs but can obscure errors. Always pair it with `respond_to_missing?` to maintain Ruby’s reflection and avoid surprises.

```ruby
class ConfigBuilder
  def initialize
    @settings = {}
  end

  def method_missing(name, *args)
    @settings[name] = args.first
  end

  def respond_to_missing?(name, _)
    true
  end

  def settings
    @settings
  end
end

cfg = ConfigBuilder.new
cfg.timeout  = 30
cfg.endpoint = 'api.example.com'
puts cfg.settings # {:timeout=>30, :endpoint=>"api.example.com"}
```