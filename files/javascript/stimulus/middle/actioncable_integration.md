## 📡 Integrating with ActionCable Channels

Subscribe to Rails ActionCable channels inside Stimulus to handle real-time updates. Place subscription logic in `connect` and clean it up in `disconnect`.

```js
import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  connect() {
    this.subscription = consumer.subscriptions.create(
      { channel: "ChatChannel" },
      { received: data => this.receiveMessage(data) }
    )
  }

  disconnect() {
    consumer.subscriptions.remove(this.subscription)
  }

  receiveMessage(data) {
    this.element.insertAdjacentHTML("beforeend", `<p>${data.content}</p>`)
  }
}
```
