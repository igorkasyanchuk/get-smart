## 🔐 JWT Channel Authentication
Use JWT tokens to authenticate WebSocket connections and restrict channel subscriptions to verified users only. Reject unauthorized connections at the `Connection` level.

```ruby
# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
    def find_verified_user
      token = request.params[:token]
      payload, _ = JWT.decode(token, Rails.application.secret_key_base)
      User.find_by(id: payload['sub']) || reject_unauthorized_connection
    rescue JWT::DecodeError
      reject_unauthorized_connection
    end
  end
end
```

Clients must pass `?token=<JWT>` when establishing the WebSocket connection. Channels can then rely on `current_user`.