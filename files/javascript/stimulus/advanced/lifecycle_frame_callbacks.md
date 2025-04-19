## 🔄 Lifecycle Frame Callbacks
To avoid layout thrashing, you can defer work until the next animation frame by leveraging `requestAnimationFrame` inside lifecycle callbacks. This ensures your DOM updates synchronously with the browser’s rendering pipeline.

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    requestAnimationFrame(() => {
      this.element.classList.add("initialized")
    })
  }
}
```
