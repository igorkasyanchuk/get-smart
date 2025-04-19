## 🔄 Lifecycle Callbacks

Stimulus controllers provide built-in lifecycle hooks—`initialize`, `connect`, and `disconnect`—to manage setup and teardown logic. Use `initialize` for one-time setup, `connect` for DOM-dependent behavior, and `disconnect` to clean up listeners or state when the element is removed.

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
    console.log("Controller initialized")
  }

  connect() {
    console.log("Controller connected to the DOM")
    this.element.addEventListener("click", this.handleClick)
  }

  disconnect() {
    console.log("Controller disconnected from the DOM")
    this.element.removeEventListener("click", this.handleClick)
  }

  handleClick = () => {
    console.log("Element clicked")
  }
}
```
