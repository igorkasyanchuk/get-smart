## 🏗️ Dynamic Association Builds in Lifecycle Callbacks

Automatically instantiate associated records with predefined defaults during the parent model's lifecycle. Coupling `after_initialize` or `after_create` with `build_association` centralizes setup logic.

```ruby
class Invoice < ApplicationRecord
  has_many :line_items, inverse_of: :invoice
  after_initialize :build_default_line_item

  private

  def build_default_line_item
    return if persisted? || line_items.any?
    line_items.build(description: 'Standard service fee', amount_cents: 0)
  end
end
```
