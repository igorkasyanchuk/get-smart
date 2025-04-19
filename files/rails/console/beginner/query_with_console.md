## 🔍 Query Records Easily

The Rails console is a great place to try out ActiveRecord queries. You can quickly fetch, filter, and inspect data from your database without writing a full script or controller action.

```ruby
# Get all users
> User.all

# Find a specific user by id
> User.find(1)

# Filter by a column
> User.where(active: true)

# Find the first matching record
> User.find_by(email: 'alice@example.com')
```