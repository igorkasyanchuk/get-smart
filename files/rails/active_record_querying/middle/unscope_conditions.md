## 🔄 Removing Conditions with `unscope`

`unscope` lets you remove specific parts of a query (such as `where`, `order`, or `limit`) to modify inherited scopes. It's handy for overriding defaults in complex chains.

```ruby
# Base scope includes active users ordered by creation date
scope = User.where(active: true).order(created_at: :desc)
# Remove the ordering clause
users = scope.unscope(:order)
```