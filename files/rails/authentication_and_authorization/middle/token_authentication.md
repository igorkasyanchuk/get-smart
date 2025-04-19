## 🔒 Setup Token-Based API Authentication

Combine Devise and `devise-jwt` to secure your Rails API with JSON Web Tokens. This approach lets clients authenticate once and include the JWT in `Authorization` headers for subsequent requests.

```ruby
# Gemfile
gem 'devise'
gem 'devise-jwt'

# app/models/user.rb
devise :database_authenticatable, :jwt_authenticatable,
       jwt_revocation_strategy: JwtDenylist

# config/initializers/devise.rb
Devise.setup do |config|
  config.jwt do |jwt|
    jwt.secret = Rails.application.credentials.fetch(:secret_key_base)
    jwt.dispatch_requests = [['POST', %r{^/login$}]]
    jwt.revocation_requests = [['DELETE', %r{^/logout$}]]
  end
end
```