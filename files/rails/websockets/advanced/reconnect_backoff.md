## 🔄 Exponential Reconnect Backoff in JS

Improve client resilience by implementing exponential backoff on disconnects. This avoids rapid reconnect attempts under poor network conditions.

```javascript
// app/javascript/channels/backoff_consumer.js
import consumer from "./consumer"

function createConsumerWithBackoff() {
  let attempts = 0

  function connect() {
    consumer.subscriptions.create("ChatChannel", {
      connected() { attempts = 0 },
      disconnected() { retry() },
      received(data) { console.log(data) }
    })
  }

  function retry() {
    const delay = Math.min(60000, 1000 * 2 ** attempts)
    setTimeout(() => { attempts += 1; connect() }, delay)
  }

  connect()
}

export default createConsumerWithBackoff