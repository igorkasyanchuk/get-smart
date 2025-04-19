## ⏱️ Throttling Frequent Events

Throttle high-frequency events (like `scroll` or `mousemove`) within Stimulus to improve performance. Use a simple throttle helper inside your controller.

```js
function throttle(fn, wait) {
  let last = 0
  return function (...args) {
    const now = Date.now()
    if (now - last >= wait) {
      last = now
      fn.apply(this, args)
    }
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.handleScroll = throttle(this.handleScroll.bind(this), 100)
    window.addEventListener("scroll", this.handleScroll)
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll)
  }

  handleScroll() {
    console.log("Throttled scroll event")
  }
}
```
