## 🔄 Handle Client Reconnection and Resubscribe

Ensure your JS client gracefully reconnects and re-subscribes after network dropouts. Use the consumer's `rejected` and `connected` callbacks to manage UI state and retries.

```js
// app/javascript/channels/consumer.js
import { createConsumer } from "@rails/actioncable"
const consumer = createConsumer()

consumer.connection.monitor.start() // start monitoring
consumer.connection.monitor.reconnectAttempts = 5

consumer.subscriptions.create(
  { channel: 'ChatRoomChannel', room_id: ROOM_ID },
  {
    connected() {
      console.log('✅ Reconnected to Action Cable')
    },
    disconnected() {
      console.log('❌ Disconnected, retrying...')
    },
    rejected() {
      alert('Subscription rejected: please refresh the page.')
    }
  }
)
```