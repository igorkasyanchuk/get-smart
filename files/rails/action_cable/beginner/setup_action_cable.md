## ⚙️ Setup Action Cable in Routes

Before using Action Cable, you need to mount the WebSocket server endpoint in your routes. This tells Rails to listen for WebSocket connections at a specific URL (usually `/cable`).

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # Mount Action Cable at /cable
  mount ActionCable.server => '/cable'

  # Your other routes...
end
```

Once mounted, Rails will handle incoming WebSocket connections at `/cable`.