## 🧩 Capturing Lexical Scope in DSLs

When building internal DSLs, `define_method` can capture outer variables, enabling clean and expressive APIs. By closing over local variables, you can generate methods that remember the context in which they were defined.

```ruby
class ConfigDSL
  def initialize
    @settings = {}
  end

  def setting(name, &block)
    # Capture the block and name for later invocation
    define_method(name) do |*args|
      @settings[name] = block.call(*args)
    end
  end

  def settings
    @settings
  end
end

# Usage
dsl = ConfigDSL.new
dsl.setting(:timeout) { 5 * 60 }
dsl.timeout        # => 300
dsl.settings       # => { timeout: 300 }
```