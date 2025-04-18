## 🛡 Avoid SQL Injection by Using Query Methods

Never interpolate user input directly into SQL queries. Use ActiveRecord query interface or parameterized queries to protect your app.

```ruby
# Bad practice
User.where("email = '#{params[:email]}'")

# Safe practice
User.where(email: params[:email])
```