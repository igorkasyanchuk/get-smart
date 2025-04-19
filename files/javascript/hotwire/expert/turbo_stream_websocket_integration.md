## 🔄 Integrate ActionCable Channels with Turbo Streams

Subscribe to a private ActionCable channel and broadcast Turbo Streams directly from the client when real‑time events occur. This allows peer‑to‑peer updates without server‑side broadcasts.

```js
import consumer from "../channels/consumer";

consumer.subscriptions.create("CommentsChannel", {
  received(data) {
    window.Turbo.renderStreamMessage(data);
  },

  post(content) {
    this.perform("post", { body: content });
  }
});
```