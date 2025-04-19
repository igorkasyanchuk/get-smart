## 🏷️ Observing Value Changes Dynamically
Stimulus `values` can emit callbacks when they change. By defining `valueChanged` methods, you can automatically react to updates, ideal for two-way synced forms or sliders.

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { volume: Number }

  volumeValueChanged(newValue, oldValue) {
    this.element.style.opacity = newValue / 100
  }
}
```
