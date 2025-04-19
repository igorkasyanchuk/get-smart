## 🔗 Tip: Defining Custom Callback Chains

Rails lets you define your own callback chains via `define_model_callbacks` for non‐CRUD events. This fosters cleaner, domain‑specific hooks.

```ruby
class Shipment < ApplicationRecord
  include ActiveSupport::Callbacks

  define_model_callbacks :dispatch, only: [:before, :after]

  before_dispatch :check_stock
  after_dispatch :notify_shipping_provider

  def dispatch
    run_callbacks :dispatch do
      update!(status: 'dispatched')
    end
  end

  private

  def check_stock
    raise 'Out of stock' unless stock_available?
  end
end
```

Custom callbacks let you model domain events with the same flexibility as Rails’ built‑in hooks.