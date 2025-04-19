## 🔔 Value Change Callbacks

Stimulus supports `<value>Changed` callbacks that trigger automatically when a value changes. Use this to reactively update the DOM or trigger side effects.

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { count: Number }

  connect() {
    this.countValue = 0
  }

  increment() {
    this.countValue++
  }

  countValueChanged(newValue, oldValue) {
    this.element.textContent = `Count: ${newValue}`
  }
}
```
