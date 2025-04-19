## 🎚️ Leveraging Values for Dynamic Behavior

Define `static values` to auto-parse attributes into typed properties. This keeps your controller logic clean and separates data definitions in HTML.

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    delay: Number,
    active: Boolean
  }

  connect() {
    if (this.activeValue) {
      setTimeout(() => this.doSomething(), this.delayValue)
    }
  }

  doSomething() {
    console.log("Action fired after delay")
  }
}
```
