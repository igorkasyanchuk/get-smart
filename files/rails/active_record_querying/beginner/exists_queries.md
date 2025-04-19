## ✅ Checking Existence with `exists?`

`exists?` checks if any record matches the given conditions without loading all records. It returns a boolean and is efficient for presence checks in conditional logic or validations.

```ruby
# Is there any admin user?
admin_exists = User.exists?(role: 'admin')

# Check by id quickly
found = Product.exists?(42)
```