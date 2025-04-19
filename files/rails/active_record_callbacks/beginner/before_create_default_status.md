## 🚀 Setting Defaults with `before_create`
`before_create` runs only on new records before the first insert. Use it to assign default statuses or tokens that should never change afterward.

```ruby
class Subscription < ApplicationRecord
  before_create :assign_uuid

  private

  def assign_uuid
    self.uuid = SecureRandom.uuid
  end
end
```

This ensures every subscription gets a unique `uuid` only once at creation.