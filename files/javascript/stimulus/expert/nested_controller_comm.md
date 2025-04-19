## 📡 Advanced Communication Between Nested Controllers

Use `Stimulus.Application.dispatch` and `application.controllerForElementAndIdentifier` to send events from a child to a parent (or sibling). This ensures decoupled hierarchy communication.

```javascript
// child_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  sendUpdate() {
    this.application.dispatch("child:update", {
      detail: { value: this.value }
    })
  }
}

// parent_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("child:update", this.receiveUpdate)
  }

  receiveUpdate = event => {
    console.log("Received from child:", event.detail.value)
  }
}
```