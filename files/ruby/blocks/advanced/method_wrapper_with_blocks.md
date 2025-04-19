## 🛠️ Dynamically Wrapping Methods with Blocks

Use `Module#prepend` and blocks to wrap existing methods for logging, authorization, or instrumentation, without modifying the original class directly.

```ruby
module LoggerWrapper
  def self.prepended(base)
    base.instance_methods(false).each do |m|
      define_method(m) do |*args, &blk|
        puts "Calling #{m} with #{args.inspect}"
        result = super(*args, &blk)
        puts "Done #{m}, returned #{result.inspect}"
        result
      end
    end
  end
end

class Calculator
  prepend LoggerWrapper

  def add(a, b)
    a + b
  end
end

Calculator.new.add(2,3)
```