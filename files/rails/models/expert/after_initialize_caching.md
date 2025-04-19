## 💡 Cache Expensive Computations on Initialization
If your model runs heavy computations or external API calls on load, use `after_initialize` plus a thread‑safe memo to avoid repeated work. This is especially useful for app‑wide lookup tables or configurations.

```ruby
class CurrencyRate < ApplicationRecord
  after_initialize :load_rate_cache

  def load_rate_cache
    @rate_cache ||= fetch_remote_rates
  end

  private

  def fetch_remote_rates
    # expensive HTTP call or complex logic
  end
end
```

The first instantiation hits the external service, and subsequent loads in the same process fetch from `@rate_cache`.