## 🐞 Debugging with console.log

Use `console.log(this)` to inspect your controller instance and targets in the browser console. This helps you verify that your controllers are connected properly.

```javascript
// debug_controller.js
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  connect() {
    console.log("Stimulus Controller Connected:", this)
  }
}
```

```html
<div data-controller="debug"></div>
```