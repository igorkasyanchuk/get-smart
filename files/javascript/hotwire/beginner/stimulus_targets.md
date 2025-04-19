## 🎯 Define and Use Stimulus Targets

Stimulus Targets let you reference elements in your controller.

```javascript
// app/javascript/controllers/form_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["input", "output"]
  greet() {
    this.outputTarget.textContent = `Hello, ${this.inputTarget.value}`
  }
}
```  
```erb
<div data-controller="form">
  <input data-form-target="input" type="text">
  <button data-action="click->form#greet">Greet</button>
  <div data-form-target="output"></div>
</div>
```