## 🔄 Use Callbacks Sparingly and Intentionally

Callbacks can be powerful, but overusing them can lead to hidden side effects and complex logic flows. Prefer service objects or explicit method calls for heavier operations. If you must use callbacks, keep them concise and focused on a single responsibility.

```ruby
class Invoice < ApplicationRecord
  before_create :generate_invoice_number

  private

  def generate_invoice_number
    self.number = "INV-#{SecureRandom.hex(5).upcase}"
  end
end
```