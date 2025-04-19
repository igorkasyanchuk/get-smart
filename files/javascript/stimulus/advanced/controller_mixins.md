## 🧪 Controller Mixins for Reusable Behavior
Extract shared logic into mixins to compose controllers without inheritance. Merge behaviors at definition time to keep controllers focused on their core responsibilities.

```javascript
// mixins/toggleable.js
export const Toggleable = Base => class extends Base {
  toggle() { this.element.classList.toggle("is-active") }
}

// controllers/menu_controller.js
import { Controller } from "@hotwired/stimulus"
import { Toggleable } from "../mixins/toggleable"

export default class extends Toggleable(Controller) {
  toggleMenu() {
    this.toggle()
  }
}
```
