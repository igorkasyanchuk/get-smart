## ⚙️ Sort Results with `order`

Use the `order` method to sort records by one or more columns. It accepts strings or hashes to define ascending/descending order. Chaining it after `where` or before `limit` is common for pagination and sorted views.

```ruby
# Ascending order by created_at
events = Event.order(created_at: :asc)

# Multiple columns, mixed directions
users = User.order(last_name: :asc, created_at: :desc)
```  
