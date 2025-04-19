## 🔒 Custom Warden Strategy for Advanced Session Management

Devise uses Warden under the hood, which you can extend to implement custom authentication flows such as token rotation, device fingerprinting, or two‑factor triggers. By creating a custom Warden strategy, you gain full control over how credentials are validated and sessions are managed without modifying Devise core.

1. Define the strategy:

```ruby
# config/initializers/warden_strategies.rb
require 'base64'

Warden::Strategies.add(:token_strategy) do
  def valid?
    request.headers['Authorization'].present?
  end

  def authenticate!
    token = request.headers['Authorization']&.split(' ')&.last
    payload = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
    user = User.find_by(id: payload['sub'], token_version: payload['ver'])

    user ? success!(user) : fail!('Invalid or expired token')
  rescue JWT::DecodeError
    fail!('Invalid token')
  end
end
```

2. Hook into Devise:

```ruby
# config/initializers/devise.rb
Devise.setup do |config|
  config.warden do |manager|
    manager.default_strategies(scope: :user).unshift :token_strategy
  end
end
```

This strategy will run before the standard database_authenticatable, allowing you to authenticate API requests seamlessly.