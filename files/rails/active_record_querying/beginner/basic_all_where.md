## 🔍 Using `.all` and `.where`

Use `.all` to retrieve all records and `.where` to filter based on conditions. This is the foundation of querying in Rails and helps you start simple searches. You can chain multiple conditions to refine your query.

```ruby
# Get all users
to_users = User.all

# Find active users
to_users = User.where(active: true)
```