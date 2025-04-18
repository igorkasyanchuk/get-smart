## 🛡️ Prevent SQL Injection with Parameterized Queries
Always use ActiveRecord's parameterized queries or query methods instead of string interpolation to prevent SQL injection attacks.

```ruby
# Unsafe
User.where("email = '#{params[:email]}'")

# Safe
User.where(email: params[:email])

# Or using placeholders
User.where("email = ?", params[:email])
```