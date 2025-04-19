## 🔍 Prevent SQL Injection with Bound Parameters

Avoid interpolating user input directly into queries. Use ActiveRecord methods or parameterized queries to bind values safely.

```ruby
# Unsafe:
User.where("email = '#{params[:email]}'")

# Safe:
User.where(email: params[:email])

# Or with raw SQL and bindings:
User.where("created_at > ?", Time.now - 7.days)
```
