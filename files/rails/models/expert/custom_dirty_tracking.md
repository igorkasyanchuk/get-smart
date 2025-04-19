## 🔥 Customize Dirty Tracking for Virtual Attributes
Sometimes you want to treat virtual attributes (not persisted in the DB) as part of the dirty tracking API. Override `attribute_will_change!` and `attribute_changed?` to hook into ActiveModel’s dirty tracking for in‑memory attributes.

```ruby
class Invoice < ApplicationRecord
  attr_accessor :discount_code

  def discount_code=(val)
    discount_code_will_change! unless val == @discount_code
    @discount_code = val
  end

  def discount_code_changed?
    attribute_changed?(:discount_code)
  end
end
```

Now you get `invoice.discount_code_changed?`, `invoice.changes`, and `invoice.save` won’t persist it but will show you changed state for downstream logic.