## 🔒 Securing Turbo Endpoints and Streams
Ensure Turbo requests carry CSRF tokens and validate authenticity server-side. For WebSocket-driven streams, confirm subscriber permissions to prevent unauthorized data leaks.

```javascript
// app/javascript/csrf_token.js
const token = document.querySelector('meta[name="csrf-token"]').content

document.addEventListener('turbo:before-fetch-request', event => {
  event.detail.fetchOptions.headers['X-CSRF-Token'] = token
})
```

```ruby
# app/channels/application_cable/channel.rb
module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
      reject unless current_user.present?
    end
  end
end
```
