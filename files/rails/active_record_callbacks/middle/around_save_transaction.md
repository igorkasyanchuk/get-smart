## 🌀 Wrap Logic with around_save
`around_save` lets you run code before and after the save operation within the same callback, ideal for transaction-related logic or performance measurement.

```ruby
class Product < ApplicationRecord
  around_save :benchmark_save

  private

  def benchmark_save
    start_time = Time.now
    yield  # proceeds to the save
    Rails.logger.info "Saved #{self.class} in #{Time.now - start_time}s"
  end
end
```

Using `yield` executes the save; you can wrap it with timers, logging, or custom transaction handling.