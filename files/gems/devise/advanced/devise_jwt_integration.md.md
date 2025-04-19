## 🔐 Integrate devise-jwt for Stateless API Authentication

For APIs, replace session cookies with JWT tokens by using the `devise-jwt` extension. Configure dispatch and revocation requests in Devise’s initializer and provide a denylist model for token revocation. This enables secure, scalable, stateless auth across distributed services.

```ruby
# Gemfile
gem 'devise-jwt'
```

```ruby
# config/initializers/devise.rb
Devise.setup do |config|
  # ... existing config
  config.jwt do |jwt|
    jwt.secret = Rails.application.credentials.jwt_secret_key
    jwt.dispatch_requests = [['POST', %r{^/login$}]]
    jwt.revocation_requests = [['DELETE', %r{^/logout$}]]
  end
end
```

```ruby
# app/models/user.rb
devise :database_authenticatable, :jwt_authenticatable,
       jwt_revocation_strategy: JwtDenylist
```

```ruby
# app/models/jwt_denylist.rb
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
  self.table_name = 'jwt_denylists'
end
```