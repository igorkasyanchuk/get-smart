## 🔄 Lifecycle: connect() and disconnect()

Stimulus controllers have lifecycle callbacks: `connect()` runs when the element is added to the DOM, `disconnect()` when removed. Clean up listeners in `disconnect()`.

```javascript
// timer_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  connect() {
    this.interval = setInterval(() => {
      console.log('tick')
    }, 1000)
  }

  disconnect() {
    clearInterval(this.interval)
  }
}
```