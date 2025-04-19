## 🚀 Dynamic Outlets Binding
Stimulus 3 introduced outlets, allowing controllers to reference descendants declaratively. You can dynamically bind outlets to nested controllers, retrieving the correct instance even when the tree changes at runtime. This is ideal for managing modal or dialog components injected via JavaScript.

```html
<div data-controller="parent">
  <div data-controller="child" data-parent-outlet="childOutlet"></div>
</div>
```

```javascript
// parent_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static outlets = ["childOutlet"]

  connect() {
    this.childOutlet.update("Hello from parent!")
  }
}
```
