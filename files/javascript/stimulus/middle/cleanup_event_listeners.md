## 🧹 Memory Cleanup in `disconnect`

Always remove global event listeners and clear intervals/timeouts in `disconnect` to prevent memory leaks, especially when controllers reload frequently.

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.intervalId = setInterval(() => this.tick(), 1000)
    window.addEventListener("resize", this.handleResize)
  }

  disconnect() {
    clearInterval(this.intervalId)
    window.removeEventListener("resize", this.handleResize)
  }

  tick() {
    console.log("Tick")
  }

  handleResize = () => {
    console.log("Window resized")
  }
}
```
