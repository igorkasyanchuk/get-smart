## 🔄 Dynamic Cost Configuration

Adjusting the cost factor dynamically ensures you get maximum security in production without sacrificing test and development performance. By setting `BCrypt::Engine.cost` based on the Rails environment, you can maintain a low cost during tests and a high cost in production.

```ruby
# config/initializers/bcrypt.rb
require 'bcrypt'

BCrypt::Engine.cost = if Rails.env.test?
  BCrypt::Engine::MIN_COST       # fast hashing in tests
elsif Rails.env.production?
  ENV.fetch('BCRYPT_COST', 12).to_i  # configurable production cost
else
  10                              # default for dev and staging
end
```

You can override `BCRYPT_COST` via environment variables to ramp up security as hardware improves.