## 🤝 Connect Action Cable Streams as Turbo Sources

Turbo allows connecting WebSocket streams as sources for real-time updates. Use `Turbo.connectStreamSource` with your Action Cable consumer to wire up broadcast channels directly to Turbo Streams.

```javascript
import consumer from './consumer';

document.addEventListener('turbo:load', () => {
  Turbo.connectStreamSource(
    consumer.subscriptions.create('ChatChannel')
  );
});
```
