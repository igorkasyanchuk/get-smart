## 🔒 Secure WebSockets with JWT Authentication at Connection

By overriding `ApplicationCable::Connection`, you can authenticate clients with JWT and reject unauthorized WebSocket connections early. This ensures only valid users can subscribe to channels, and you can embed claims for fine‑grained access control.

```ruby
# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      token = request.params[:token]
      payload, = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      self.current_user = User.find(payload['sub'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      reject_unauthorized_connection
    end
  end
end
```

Clients must attach the token on connect: 

```js
// app/javascript/channels/consumer.js
import consumer from "@rails/actioncable"

consumer.createConsumer(`/cable?token=${localStorage.getItem('jwt')}`)
```

This pattern centralizes authentication in a single place and prevents unauthorized consumption of resources.
