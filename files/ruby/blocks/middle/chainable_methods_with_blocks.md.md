## 🔍 Build Chainable APIs with `tap` and Custom Blocks

`tap` yields the receiver to a block and returns it, letting you chain methods while inspecting or modifying state. This is ideal for builder patterns or setting up objects step by step.

```ruby
class Configurator
  attr_accessor :options

  def initialize
    @options = {}
  end

  def set(key, value)
    options[key] = value
    self
  end

  def configure
    tap do |cfg|
      yield(cfg)
    end
  end
end

config = Configurator.new.configure do |c|
  c.set(:host, 'localhost').set(:port, 3000)
end

puts config.options
# => {:host=>"localhost", :port=>3000}
```