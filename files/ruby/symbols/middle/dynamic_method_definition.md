## 🔧 Define Methods Dynamically with `define_method` and Symbols
Ruby’s `define_method` accepts a symbol (or string) name and block, letting you generate methods programmatically. Combined with symbols, you can DRY up repetitive getters/setters or build internal DSLs without manual method definitions.

```ruby
class Config
  [:host, :port, :database].each do |attr|
    define_method(attr) { @config[attr] }
    define_method("#{attr}=") { |value| @config[attr] = value }
  end

  def initialize(config = {})
    @config = config
  end
end

cfg = Config.new(host: "localhost", port: 5432)
puts cfg.host           # => "localhost"
cfg.database = "my_db"
puts cfg.database       # => "my_db"
```