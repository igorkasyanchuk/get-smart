## 🏗️ Using the initialize() Method

`initialize()` is called when a controller instance is created, before `connect()`. Use it for setting up initial state.

```javascript
// toggle_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  initialize() {
    this.visible = false
  }

  toggle() {
    this.visible = !this.visible
    this.element.style.display = this.visible ? "block" : "none"
  }
}
```

```html
<div data-controller="toggle">
  <button data-action="click->toggle#toggle">Toggle content</button>
  <div>Hidden content</div>
</div>
```