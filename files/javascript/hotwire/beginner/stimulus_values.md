## 🧮 Use Stimulus Values for Configuration

Stimulus Values let you pass data into your controller in a typed manner.

```javascript
// app/javascript/controllers/clock_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static values = { interval: Number }
  connect() {
    this.tick()
    this.timer = setInterval(() => this.tick(), this.intervalValue)
  }
  tick() {
    this.element.textContent = new Date().toLocaleTimeString()
  }
  disconnect() {
    clearInterval(this.timer)
  }
}
```  
```erb
<div data-controller="clock"
     data-clock-interval-value="1000">
</div>
```