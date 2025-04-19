## 🔗 Nested Controllers with Target Delegation
Advanced UIs often require nested controllers communicating via targets rather than global events. Define a parent and child controller, then assign the child’s element as a target of the parent. The parent can call methods on the child directly, ensuring tight coupling only where necessary.

```javascript
// app/javascript/controllers/parent_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["child"]

  connect() {
    this.childController = this.childTarget.controller
  }

  notifyChild() {
    this.childController.updateData("New Data")
  }
}

// app/javascript/controllers/child_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateData(data) {
    this.element.textContent = data
  }
}
```
