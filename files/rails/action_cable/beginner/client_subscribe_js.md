## 📡 Subscribing to a Channel in JavaScript

On the client side, subscribe to your channel in a JavaScript pack. This will open a WebSocket connection and let you handle incoming data in real time.

```javascript
// app/javascript/channels/chat_channel.js
import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    console.log("✅ Connected to ChatChannel")
  },

  disconnected() {
    console.log("❌ Disconnected from ChatChannel")
  },

  received(data) {
    // Called when there's incoming data on the WebSocket
    console.log("New message:", data)
  }
})
```

Include this file in your application pack (e.g., `import "channels/chat_channel"`).