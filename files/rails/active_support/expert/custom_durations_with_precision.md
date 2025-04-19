## ⏱ Create High-Precision Durations and Time Calculations
ActiveSupport::Duration supports arbitrary units. Combine durations with custom units by extending the `Duration` class, enabling sub-second precision for performance-sensitive tasks.

```ruby
ActiveSupport::Duration::PARTS << :millisecond
ActiveSupport::Duration.class_eval do
  def milliseconds
    ActiveSupport::Duration.new(self.value / 1000.0, [[:millisecond, self.value]])
  end
end

# Usage
timeout = 2500.milliseconds + 1.second
puts timeout.inspect # => "3.5 seconds"
```

This hack allows fine-grained scheduling beyond Rails’ default second granularity.