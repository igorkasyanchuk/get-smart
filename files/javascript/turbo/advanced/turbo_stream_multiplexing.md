## 🔄 Turbo Stream Multiplexing for Real-time Updates
Combine multiple WebSocket channels into a single UI update stream using Turbo Streams. This pattern centralizes real-time events and avoids redundant DOM operations by calling `Turbo.renderStreamMessage` for each incoming payload.

```javascript
// app/javascript/channels/index.js
import * as ActionCable from '@rails/actioncable'
const consumer = ActionCable.createConsumer()

['ChatChannel', 'NotificationsChannel'].forEach(channel => {
  consumer.subscriptions.create({ channel }, {
    received(data) {
      Turbo.renderStreamMessage(data)
    }
  })
})
```
