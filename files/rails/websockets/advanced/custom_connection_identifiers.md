## 🔒 Custom Connection Identifiers & Auth

Enhance security and tracking by identifying connections with custom properties (e.g., UUIDs or roles) and authenticating users in `Connection`. This allows per-connection rate‐limiting or access control.

```ruby
# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :connection_uuid

    def connect
      self.current_user = find_verified_user
      self.connection_uuid = SecureRandom.uuid
    end

    private

    def find_verified_user
      if (user = User.find_by(id: cookies.signed[:user_id]))
        user
      else
        reject_unauthorized_connection
      end
    end
  end
end
```