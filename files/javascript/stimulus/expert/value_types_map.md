## 🗺️ Using Map Values for Complex Data Structures

Stimulus values support primitives and objects, but complex data like maps or sets require hydration. Wrap them in a JSON‑compatible container and rehydrate in `connect()`. This allows you to use `Map` for quick lookups and mutations.

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { entries: Array }

  connect() {
    // Deserialize into a Map
    this.entryMap = new Map(this.entriesValue)
  }

  getEntry(key) {
    return this.entryMap.get(key)
  }

  setEntry(key, value) {
    this.entryMap.set(key, value)
    this.element.dataset.entries = JSON.stringify([...this.entryMap])
  }
}
```