## 📡 Mounting Action Cable in Routes

Mount the Action Cable server in your routes to open a WebSocket endpoint. This ensures clients can establish a connection at a given path.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  # other routes...
end
```
