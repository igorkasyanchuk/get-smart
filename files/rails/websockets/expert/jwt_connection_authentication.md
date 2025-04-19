## 🔒 Advanced Connection Authentication with JWT
This tip demonstrates how to securely identify and authenticate WebSocket connections in ActionCable using JSON Web Tokens. By verifying the token in the `connect` method, you can enforce per-connection authorization and attach user context to every channel subscription.

```ruby
# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      token = request.params[:token]
      payload = JWT.decode(token, Rails.application.secrets.jwt_secret, true, algorithm: 'HS256').first
      self.current_user = User.find(payload['sub'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      reject_unauthorized_connection
    end
  end
end
```

Above, we decode and validate the JWT, then set `current_user` for downstream channels. Unauthorized or invalid tokens immediately terminate the connection.