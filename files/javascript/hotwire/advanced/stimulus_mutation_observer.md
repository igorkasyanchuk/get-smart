## 🔍 Stimulus Controller with MutationObserver
Combine Stimulus with `MutationObserver` to react to Turbo Stream DOM changes inside your controller. Perfect for initializing third‑party libraries dynamically.

```javascript
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.observer = new MutationObserver(() => this.initializeWidget())
    this.observer.observe(this.element, { childList: true, subtree: true })
  }

  initializeWidget() {
    // initialize or refresh your widget
  }

  disconnect() {
    this.observer.disconnect()
  }
}
```

Attach this controller to any container receiving streamed content.