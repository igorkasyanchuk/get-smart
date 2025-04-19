## 🎨 CSS Class Management by State

Manipulate CSS classes on your element or targets to reflect state changes. Use `classList` or `toggle` for clean, readable code.

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.active = false
  }

  toggleActive() {
    this.active = !this.active
    this.element.classList.toggle("is-active", this.active)
  }
}
```
