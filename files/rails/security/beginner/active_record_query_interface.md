## 🚫 Prevent SQL Injection with Query Interface
Avoid string interpolation in queries. Always use ActiveRecord’s parameter binding or named placeholders to automatically escape inputs.

```ruby
# Bad (vulnerable):
User.where("email = '#{params[:email]}'")

# Good:
User.where(email: params[:email])
# or with placeholders:
User.where("email = :email", email: params[:email])
```
