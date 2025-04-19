## 🏃‍♂️ Debounce High-Frequency Events with requestIdleCallback

For scroll or resize, `requestIdleCallback` lets you defer work until the browser is idle. Wrap your logic to avoid layout thrashing or jank.

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.onScroll = this.onScroll.bind(this)
    document.addEventListener('scroll', this.onScroll)
  }

  disconnect() {
    document.removeEventListener('scroll', this.onScroll)
  }

  onScroll(event) {
    if (this.idleHandle) cancelIdleCallback(this.idleHandle)
    this.idleHandle = requestIdleCallback(() => {
      this.doExpensiveLayoutUpdate()
    })
  }

  doExpensiveLayoutUpdate() {
    // expensive DOM reads/writes
  }
}
```