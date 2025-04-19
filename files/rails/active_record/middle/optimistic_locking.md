## 🔒 Prevent Race Conditions with Optimistic Locking

Add a `lock_version` integer column to enable optimistic locking. ActiveRecord raises an exception if concurrent updates conflict, letting you handle retries gracefully.

```ruby
# migration:
add_column :products, :lock_version, :integer, default: 0, null: false

# usage:
product = Product.find(1)
product.price = 9.99
product.save!  # raises ActiveRecord::StaleObjectError if version mismatches
```