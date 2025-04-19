## 🔑 Implement JWT Refresh Token Rotation

Stateless JWT API tokens risk stolen credentials; rotating refresh tokens after each use improves security by invalidating old tokens immediately. Store a hashed version of the refresh token in the database and issue short‑lived access tokens along with long‑lived refresh tokens.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_secure_token :refresh_token
end
```

```ruby
# app/controllers/api/v1/auth_controller.rb
class Api::V1::AuthController < ApplicationController
  def refresh
    old_token = params[:refresh_token]
    user = User.find_by(refresh_token: Digest::SHA256.hexdigest(old_token))
    return head :unauthorized unless user

    # Rotate token
    new_token = user.regenerate_refresh_token
    access_token = JWT.encode({ sub: user.id, exp: 15.minutes.from_now.to_i }, Rails.application.secret_key_base)

    render json: { access_token: access_token, refresh_token: new_token }
  end
end
```

Each time the client calls `/refresh`, the server generates and stores a new `refresh_token`, invalidating the previous one.