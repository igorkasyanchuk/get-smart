## ⚙️ Adjusting BCrypt Cost for Different Environments

BCrypt’s cost factor determines how computationally expensive hashing is. In development and test, you can reduce the cost to speed up your suite, while keeping a high cost in production to maximize security. Use environment checks or Rails initializers to set it dynamically.

```ruby
# config/initializers/bcrypt.rb
if Rails.env.test? || Rails.env.development?
  BCrypt::Engine.cost = BCrypt::Engine::MIN_COST
else
  BCrypt::Engine.cost = 12  # production strength; increase over time
end
```