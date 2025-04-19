## 🎬 Bind Events with Stimulus Actions

Use `data-action` to connect DOM events to controller methods.

```erb
<button data-controller="counter"
        data-action="click->counter#increment">
  Click me
</button>
```  
```javascript
// app/javascript/controllers/counter_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  increment() {
    this.element.textContent = parseInt(this.element.textContent || 0) + 1
  }
}
```