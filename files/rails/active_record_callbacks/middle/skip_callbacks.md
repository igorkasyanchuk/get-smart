## 🚫 Skip Callbacks with `skip_callback`
Sometimes you need to bypass callbacks in tests or special flows. Use `skip_callback` to disable them temporarily and restore later.

```ruby
class Payment < ApplicationRecord
  before_save :charge_external_service
end

# Disable callback globally
Payment.skip_callback(:save, :before, :charge_external_service)
# ...perform actions without charging...
Payment.set_callback(:save, :before, :charge_external_service)
```

Be cautious: disabling callbacks affects all future operations, so restore them immediately after.