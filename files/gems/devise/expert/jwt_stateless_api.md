## 🛡️ Stateless JWT Authentication for APIs
Implement a fully stateless API by replacing Devise’s session store with JWTs signed by your Rails secret. This tip describes how to override `Devise::SessionsController` to issue access and refresh tokens, validate them, and handle revocation securely. Use `jwt` and `ActiveSupport::MessageVerifier` for signature and rotation.

```ruby
# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.valid_password?(params[:user][:password])
      tokens = JwtService.encode(user_id: user.id)
      render json: tokens, status: :created
    else
      render json: {error: 'Invalid credentials'}, status: :unauthorized
    end
  end
end

# app/services/jwt_service.rb
class JwtService
  SECRET = Rails.application.credentials.jwt_secret

  def self.encode(payload)
    exp = 15.minutes.from_now.to_i
    token = JWT.encode(payload.merge(exp: exp), SECRET, 'HS256')
    { access: token }
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET, true, algorithm: 'HS256')
    decoded.first.symbolize_keys
  rescue JWT::ExpiredSignature, JWT::DecodeError => e
    raise UnauthorizedError, e.message
  end
end
```