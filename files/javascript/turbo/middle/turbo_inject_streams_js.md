## 🚀 Inject Turbo Streams via JavaScript

You can manually render Turbo Stream messages received via WebSockets or fetch requests by calling `Turbo.renderStreamMessage`. This is useful for async updates outside of Rails broadcasts.

```javascript
fetch('/notifications/stream')
  .then(response => response.text())
  .then(html => {
    Turbo.renderStreamMessage(html);
  });
```
