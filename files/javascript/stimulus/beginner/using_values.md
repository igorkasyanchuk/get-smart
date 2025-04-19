## 💾 Working with Values

Values are reactive properties you can define in your controller. They simplify passing dynamic data from HTML to JS.

```javascript
// counter_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static values = { count: Number }

  connect() {
    this.updateDisplay()
  }

  increment() {
    this.countValue++
    this.updateDisplay()
  }

  updateDisplay() {
    this.element.textContent = `Count: ${this.countValue}`
  }
}
```

```html
<div data-controller="counter" data-counter-count-value="0">
  <button data-action="click->counter#increment">+</button>
</div>
```