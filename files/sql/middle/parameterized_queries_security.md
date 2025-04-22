## 🔒 Use Parameterized Queries to Prevent SQL Injection
Instead of concatenating user inputs into SQL strings, use prepared statements or ORM placeholders to safely inject parameters. This protects your application from injection attacks and often improves performance due to query plan caching.

```ruby
# Using ActiveRecord
User.where("email = ? AND active = ?", params[:email], true)

# Using raw PG connection
conn.exec_params("SELECT * FROM users WHERE id = $1", [user_id])
```