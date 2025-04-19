## 🗑️ Optimize Memory with WeakMap References

Store per-element state in a `WeakMap` keyed by the element, preventing memory leaks when elements are removed. This is critical for long‑lived single-page apps.

```javascript
import { Controller } from "@hotwired/stimulus"

const stateStore = new WeakMap()

export default class extends Controller {
  connect() {
    stateStore.set(this.element, { count: 0 })
  }

  increment() {
    const state = stateStore.get(this.element)
    state.count++
    this.element.textContent = `Count: ${state.count}`
  }

  disconnect() {
    // no need to manually clean up
  }
}
```