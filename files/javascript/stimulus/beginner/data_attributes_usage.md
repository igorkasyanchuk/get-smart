## 🏷️ Using Custom Data Attributes

Stimulus plays nicely with HTML `data-` attributes. Store initial values or flags directly on elements and read them in the controller.

```html
<div data-controller="alert"
     data-alert-type="warning"
     data-alert-message="Watch out!">
  <button data-action="click->alert#show">Show Alert</button>
</div>
```

```javascript
// alert_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  show() {
    const type = this.element.dataset.alertType
    const message = this.element.dataset.alertMessage
    alert(`${type.toUpperCase()}: ${message}`)
  }
}
```