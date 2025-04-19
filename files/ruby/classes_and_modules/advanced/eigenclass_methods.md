## ✨ Defining Class Methods via the Eigenclass

You can open the singleton class (eigenclass) to add private or protected class methods and mixins in a clear, encapsulated way.

```ruby
class Payment
  class << self
    private

    def gateway_config
      @config ||= {timeout: 5}
    end
  end

  def self.process(amount)
    puts "Processing with timeout=#{gateway_config[:timeout]}"
  end
end

Payment.process(100) # => "Processing with timeout=5"
```

Use this pattern to hide implementation details of your class-level API.