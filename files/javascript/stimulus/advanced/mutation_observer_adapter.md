## 🕵️ Mutation Observer Adapter
When dealing with dynamic content inserted outside Stimulus’s direct control, use a MutationObserver to notify Stimulus of new elements. Wrap the adapter logic so you can reuse it across multiple controllers.

```javascript
// observer_adapter.js
export function observe(controller, callback) {
  const observer = new MutationObserver(callback)
  observer.observe(controller.element, { childList: true, subtree: true })
}

// usage in any controller
import { Controller } from "@hotwired/stimulus"
import { observe } from "../adapters/observer_adapter"

export default class extends Controller {
  connect() {
    observe(this, (mutations) => {
      mutations.forEach((mutation) => {
        // handle insertion
      })
    })
  }
}
```
