## 🔒 Use optimistic locking to avoid race conditions

Add a `lock_version` column to your table to enable optimistic locking:

```ruby
class Product < ApplicationRecord
end
```

When two users edit the same record, Rails raises an `ActiveRecord::StaleObjectError` if a stale update occurs:

```ruby
product1 = Product.find(1)
product2 = Product.find(1)
product1.update(price: 10)
product2.update(price: 15) # raises error
```

This prevents silent overwrites.