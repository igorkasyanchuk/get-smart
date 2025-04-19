## 🌐 Integrate Server-Sent Events in a Controller

Use SSE to push real-time updates without WebSockets. Instantiate `EventSource` in `connect()` and close it in `disconnect()` to avoid dangling connections.

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.source = new EventSource('/notifications/stream')
    this.source.onmessage = e => this.handleUpdate(JSON.parse(e.data))
  }

  disconnect() {
    this.source.close()
  }

  handleUpdate(data) {
    // update DOM accordingly
    this.element.insertAdjacentHTML('beforeend', `<p>${data.message}</p>`)
  }
}
```